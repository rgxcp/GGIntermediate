require "mysql2"
require_relative "models/category"
require_relative "models/item"

def create_db_client
    client = Mysql2::Client.new(
        :host => "localhost",
        :username => "northern",
        :password => "12345678",
        :database => "food_oms"
    )
end

def get_items
    client = create_db_client
    rows = client.query(
        "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
        FROM items
        JOIN item_categories
        ON items.id = item_categories.item_id
        JOIN categories
        ON item_categories.category_id = categories.id
        ORDER BY items.id ASC"
    )
    items = []
    rows.each do |row|
        category = Category.new(row["category_id"], row["category_name"])
        item = Item.new(row["id"], row["name"], row["price"], category)
        items << item
    end
    items
end

def get_categories
    client = create_db_client
    rows = client.query("SELECT * FROM categories ORDER BY name ASC")
    categories = []
    rows.each do |row|
        category = Category.new(row["id"], row["name"])
        categories << category
    end
    categories
end

def get_item(id)
    client = create_db_client
    row = client.query(
        "SELECT items.id, items.name, items.price, categories.id AS category_id, categories.name AS category_name
        FROM items
        JOIN item_categories
        ON items.id = item_categories.item_id
        JOIN categories
        ON item_categories.category_id = categories.id
        WHERE items.id = #{id}"
    ).first
    category = Category.new(row["category_id"], row["category_name"])
    item = Item.new(row["id"], row["name"], row["price"], category)
end

def create_item(name, price, category_id)
    client = create_db_client
    client.query("INSERT INTO items(name, price) VALUES('#{name}', #{price})")
    client.query("INSERT INTO item_categories(item_id, category_id) VALUES(#{client.last_id}, #{category_id})")
end

def update_item(id, name, price, category_id)
    client = create_db_client
    client.query("UPDATE items SET name = '#{name}', price = #{price} WHERE id = #{id}")
    client.query("UPDATE item_categories SET category_id = #{category_id} WHERE item_id = #{id}")
end

def delete_item(id)
    client = create_db_client
    client.query("DELETE FROM item_categories WHERE item_id = #{id}")
    client.query("DELETE FROM items WHERE id = #{id}")
end
