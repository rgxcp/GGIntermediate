require_relative "category"
require_relative "../db/mysql_connector"

class Item
    attr_reader :id, :name, :price, :categories

    def initialize(id, name, price, categories = [])
        @id = id
        @name = name
        @price = price
        @categories = categories
    end

    def self.all
        client = MySQLConnector.create_db_client
        items = []
        client.query("SELECT * FROM items ORDER BY id ASC").each do |row|
            item = Item.new(row["id"], row["name"], row["price"])
            items << item
        end
        items
    end

    def self.find(id)
        client = MySQLConnector.create_db_client
        item_row = client.query("SELECT * FROM items WHERE id = #{id}").first
        categories = []
        client.query(
            "SELECT * FROM categories
            WHERE id IN (
                SELECT category_id
                FROM item_categories
                WHERE item_id = #{id}
            )"
        ).each do |category_row|
            category = Category.new(category_row["id"], category_row["name"])
            categories << category
        end
        item = Item.new(item_row["id"], item_row["name"], item_row["price"], categories)
    end

    def self.create(params)
        client = MySQLConnector.create_db_client
        client.query("INSERT INTO items(name, price) VALUES('#{params[:name]}', #{params[:price]})")
        item_id = client.last_id
        params[:category_ids].each do |category_id|
            client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{item_id}, #{category_id})")
        end
    end

    def self.update(params)
        client = MySQLConnector.create_db_client
        client.query("UPDATE items SET name = '#{params[:name]}', price = #{params[:price]} WHERE id = #{params[:id]}")
        client.query("DELETE FROM item_categories WHERE item_id = #{params[:id]}")
        params[:category_ids].each do |category_id|
            client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{params[:id]}, #{category_id})")
        end
    end

    def self.destroy(id)
        client = MySQLConnector.create_db_client
        client.query("DELETE FROM item_categories WHERE item_id = #{id}")
        client.query("DELETE FROM items WHERE id = #{id}")
    end
end
