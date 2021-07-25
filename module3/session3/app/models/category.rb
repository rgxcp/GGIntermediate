require_relative "item"
require_relative "../db/mysql_connector"

class Category
    attr_reader :id, :name, :items

    def initialize(id, name, items = [])
        @id = id
        @name = name
        @items = items
    end

    def self.all
        client = MySQLConnector.create_db_client
        categories = []
        client.query("SELECT * FROM categories ORDER BY name ASC").each do |row|
            category = Category.new(row["id"], row["name"])
            categories << category
        end
        categories
    end

    def self.find(id)
        client = MySQLConnector.create_db_client
        row = client.query("SELECT * FROM categories WHERE id = #{id}").first
        category = Category.new(row["id"], row["name"])
    end

    def self.items(category_id)
        client = MySQLConnector.create_db_client
        items = []
        client.query(
            "SELECT * FROM items
            WHERE id IN (
                SELECT item_id
                FROM item_categories
                WHERE category_id = #{category_id}
            )"
        ).each do |row|
            item = Item.new(row["id"], row["name"], row["price"])
            items << item
        end
        items
    end

    def self.create(name)
        client = MySQLConnector.create_db_client
        client.query("INSERT INTO categories(name) VALUES('#{name}')")
    end

    def self.update(params)
        client = MySQLConnector.create_db_client
        client.query("UPDATE categories SET name = '#{params[:name]}' WHERE id = #{params[:id]}")
    end

    def self.destroy(id)
        client = MySQLConnector.create_db_client
        client.query("DELETE FROM item_categories WHERE category_id = #{id}")
        client.query("DELETE FROM categories WHERE id = #{id}")
    end
end
