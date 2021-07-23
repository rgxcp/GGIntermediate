require "sinatra"
require "sinatra/reloader"
require_relative "models/category"
require_relative "models/item"

get "/" do
    items = Item::all
    erb :index, locals: {
        items: items
    }
end

get "/items/new" do
    categories = Category::all
    erb :create, locals: {
        categories: categories
    }
end

get "/items/:id/show" do
    item = Item::find(params[:id])
    erb :show, locals: {
        item: item
    }
end

get "/items/:id/edit" do
    item = Item::find(params[:id])
    categories = Category::all
    erb :edit, locals: {
        item: item,
        categories: categories
    }
end

post "/items/create" do
    Item::create(
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

put "/items/:id/update" do
    Item::update(
        params[:id],
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

delete "/items/:id/destroy" do
    Item::destroy(params[:id])
    redirect "/"
end
