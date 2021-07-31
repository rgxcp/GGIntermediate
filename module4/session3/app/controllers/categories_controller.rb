require_relative "../models/category"

class CategoriesController
    def self.index
        @categories = Category.all
        renderer = ERB.new(File.read("app/views/categories/index.erb"))
        renderer.result(binding)
    end

    def self.new
        renderer = ERB.new(File.read("app/views/categories/new.erb"))
        renderer.result(binding)
    end

    def self.edit(id)
        @category = Category.find(id)
        renderer = ERB.new(File.read("app/views/categories/edit.erb"))
        renderer.result(binding)
    end

    def self.create(params)
        Category.create(params)
    end

    def self.update(params)
        Category.update(params)
    end

    def self.destroy(id)
        Category.destroy(id)
    end
end
