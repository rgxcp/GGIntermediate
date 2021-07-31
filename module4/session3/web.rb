require "sinatra"
require_relative "app/controllers/categories_controller"
require_relative "app/controllers/category_items_controller"
require_relative "app/controllers/items_controller"

# Items
get "/" do
    ItemsController.index
end

get "/items/new" do
    ItemsController.new
end

get "/items/:id" do
    ItemsController.show(params[:id])
end

get "/items/:id/edit" do
    ItemsController.edit(params[:id])
end

post "/items" do
    redirect "/" if ItemsController.create(params)
end

put "/items/:id" do
    redirect "/" if ItemsController.update(params)
end

delete "/items/:id" do
    redirect "/" if ItemsController.destroy(params[:id])
end

# Categories
get "/categories" do
    CategoriesController.index
end

get "/categories/new" do
    CategoriesController.new
end

get "/categories/:id/edit" do
    CategoriesController.edit(params[:id])
end

post "/categories" do
    redirect "/categories" if CategoriesController.create(params)
end

put "/categories/:id" do
    redirect "/categories" if CategoriesController.update(params)
end

delete "/categories/:id" do
    redirect "/categories" if CategoriesController.destroy(params[:id])
end

# Category Items
get "/categories/:id/items" do
    CategoryItemsController.index(params[:id])
end
