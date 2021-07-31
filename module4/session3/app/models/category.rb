require_relative "item"
require_relative "../db/mysql_connector"

class Category
    attr_reader :id, :name, :items

    def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @items = []
    end

    def self.all
        client = MySQLConnector.create_db_client
        categories = []
        client.query("SELECT * FROM categories ORDER BY name ASC").each do |row|
            category = Category.new({
                :id => row["id"],
                :name => row["name"]
            })
            categories << category
        end
        categories
    end

    def self.find(id)
        client = MySQLConnector.create_db_client
        row = client.query("SELECT * FROM categories WHERE id = #{id}").first
        if row
            category = Category.new({
                :id => row["id"],
                :name => row["name"]
            })
        else
            nil
        end
    end

    def get_items
        client = MySQLConnector.create_db_client
        client.query(
            "SELECT * FROM items
            WHERE id IN (
                SELECT item_id
                FROM item_categories
                WHERE category_id = #{@id}
            )"
        ).each do |row|
            item = Item.new({
                :id => row["id"],
                :name => row["name"],
                :price => row["price"]
            })
            @items << item
        end
        self
    end

    def self.create(params)
        false unless params[:name].nil? || params[:name].empty?
        client = MySQLConnector.create_db_client
        client.query("INSERT INTO categories(name) VALUES('#{params[:name]}')")
        true
    end

    def self.update(params)
        false unless params[:name].nil? || params[:name].empty?
        client = MySQLConnector.create_db_client
        client.query("UPDATE categories SET name = '#{params[:name]}' WHERE id = #{params[:id]}")
        true
    end

    def self.destroy(id)
        client = MySQLConnector.create_db_client
        client.query("DELETE FROM item_categories WHERE category_id = #{id}")
        client.query("DELETE FROM categories WHERE id = #{id}")
        true
    end
end
