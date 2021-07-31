require_relative "../models/category"
require_relative "../models/item"

class ItemsController
    def self.index
        @items = Item.all
        renderer = ERB.new(File.read("app/views/items/index.erb"))
        renderer.result(binding)
    end

    def self.new
        @categories = Category.all
        renderer = ERB.new(File.read("app/views/items/new.erb"))
        renderer.result(binding)
    end

    def self.show(id)
        @item = Item.find(id)
        if @item.categories.empty?
            @categories = "-"
        else
            @categories = @item.categories.map(&:name).join(", ")
        end
        renderer = ERB.new(File.read("app/views/items/show.erb"))
        renderer.result(binding)
    end

    def self.edit(id)
        @item = Item.find(id)
        @categories = Category.all
        @item_category_ids = @item.categories.map(&:id)
        renderer = ERB.new(File.read("app/views/items/edit.erb"))
        renderer.result(binding)
    end

    def self.create(params)
        Item.create(params)
    end

    def self.update(params)
        Item.update(params)
    end

    def self.destroy(id)
        Item.destroy(id)
    end
end
