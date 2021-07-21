require "mysql2"

def create_db_client
    client = Mysql2::Client.new(
        :host => ENV["GG_DB_HOST"],
        :username => ENV["GG_DB_USERNAME"],
        :password => ENV["GG_DB_PASSWORD"],
        :database => ENV["GG_DB_DATABASE"]
    )
end
