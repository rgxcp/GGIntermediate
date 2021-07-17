require "sinatra"
require "sinatra/reloader"

get "/messages" do
    "<h1 style=\"background-color: DodgerBlue;\">Hello, World!</h1>"
end

get "/messages/:name" do
    name = params[:name]
    color = params[:color] ? params[:color] : "DodgerBlue"
    erb :messages, locals: {
        color: color,
        name: name
    }
end

get "/login" do
    erb :login
end

post "/login" do
    if params[:username] == "admin" && params[:password] == "admin"
        "Logged In"
    else
        redirect "/login"
    end
end

get "/lists" do
    lists = ["Pencil", "Eraser", "Ruler"]
    erb :lists, locals: {
        lists: lists
    }
end

get "/lists/new" do
    erb :create_list
end

post "/lists/store" do
    "You're adding #{params["name"]} as a new list."
end
