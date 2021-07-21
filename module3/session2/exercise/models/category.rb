require_relative "../db/mysql_connector"

class Category
    attr_reader :id, :name

    def initialize(id, name)
        @id = id
        @name = name
    end

    def Category.all
        client = create_db_client
        rows = client.query("SELECT * FROM categories ORDER BY name ASC")
        categories = []
        rows.each do |row|
            category = Category.new(row["id"], row["name"])
            categories << category
        end
        categories
    end
end
