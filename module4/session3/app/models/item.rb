require_relative "category"
require_relative "../db/mysql_connector"

class Item
    attr_reader :id, :name, :price, :categories

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @price = params[:price]
        @categories = []
    end

    def self.all
        client = MySQLConnector.create_db_client
        items = []
        client.query("SELECT * FROM items ORDER BY id ASC").each do |row|
            item = Item.new({
                :id => row["id"],
                :name => row["name"],
                :price => row["price"]
            })
            items << item
        end
        items
    end

    def self.find(id)
        client = MySQLConnector.create_db_client
        item_row = client.query("SELECT * FROM items WHERE id = #{id}").first
        item = Item.new({
            :id => item_row["id"],
            :name => item_row["name"],
            :price => item_row["price"]
        })
        client.query(
            "SELECT * FROM categories
            WHERE id IN (
                SELECT category_id
                FROM item_categories
                WHERE item_id = #{id}
            )"
        ).each do |category_row|
            category = Category.new({
                :id => category_row["id"],
                :name => category_row["name"]
            })
            item.categories << category
        end
        item
    end

    def self.create(params)
        false unless params[:name].nil? || params[:name].empty? || params[:price].nil? || params[:category_ids].nil? || params[:category_ids].empty?
        client = MySQLConnector.create_db_client
        client.query("INSERT INTO items(name, price) VALUES('#{params[:name]}', #{params[:price]})")
        item_id = client.last_id
        params[:category_ids].each do |category_id|
            client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{item_id}, #{category_id})")
        end
        true
    end

    def self.update(params)
        false unless params[:name].nil? || params[:name].empty? || params[:price].nil? || params[:category_ids].nil? || params[:category_ids].empty?
        client = MySQLConnector.create_db_client
        client.query("UPDATE items SET name = '#{params[:name]}', price = #{params[:price]} WHERE id = #{params[:id]}")
        client.query("DELETE FROM item_categories WHERE item_id = #{params[:id]}")
        params[:category_ids].each do |category_id|
            client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{params[:id]}, #{category_id})")
        end
        true
    end

    def self.destroy(id)
        client = MySQLConnector.create_db_client
        client.query("DELETE FROM item_categories WHERE item_id = #{id}")
        client.query("DELETE FROM items WHERE id = #{id}")
        true
    end
end
