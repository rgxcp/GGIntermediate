require_relative "../models/category"

class CategoryItemsController
    def self.index(id)
        @category = Category.find(id)
        @category.get_items if @category
        if @category && @category.items.length > 1
            renderer = ERB.new(File.read("app/views/categories/items/index.erb"))
        else
            renderer = ERB.new(File.read("app/views/404.erb"))
        end
        renderer.result(binding)
    end
end
