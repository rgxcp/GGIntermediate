require "sinatra"
require "sinatra/reloader"
require_relative "db_connector"

get "/" do
    items = get_items
    erb :index, locals: {
        items: items
    }
end

get "/items/new" do
    categories = get_categories
    erb :create, locals: {
        categories: categories
    }
end

get "/items/:id/show" do
    item = get_item(params[:id])
    erb :show, locals: {
        item: item
    }
end

get "/items/:id/edit" do
    item = get_item(params[:id])
    categories = get_categories
    erb :edit, locals: {
        item: item,
        categories: categories
    }
end

post "/items/create" do
    create_item(
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

put "/items/:id/update" do
    update_item(
        params[:id],
        params[:name],
        params[:price],
        params[:category_id]
    )
    redirect "/"
end

delete "/items/:id/destroy" do
    delete_item(params[:id])
    redirect "/"
end
