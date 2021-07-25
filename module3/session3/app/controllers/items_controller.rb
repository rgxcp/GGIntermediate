require_relative "application_controller"
require_relative "../models/category"
require_relative "../models/item"

class ItemsController < ApplicationController
    get "/" do
        @items = Item.all
        erb :"items/index"
    end

    get "/items/new" do
        @categories = Category.all
        erb :"items/new"
    end

    get "/items/:id" do
        @item = Item.find(params[:id])
        if @item.categories.empty?
            @categories = "-"
        else
            @categories = @item.categories.map(&:name).join(", ")
        end
        erb :"items/show"
    end

    get "/items/:id/edit" do
        @item = Item.find(params[:id])
        @categories = Category.all
        @item_category_ids = @item.categories.map(&:id)
        erb :"items/edit"
    end

    post "/items" do
        Item.create(params)
        redirect "/"
    end

    put "/items/:id" do
        Item.update(params)
        redirect "/"
    end

    delete "/items/:id" do
        Item.destroy(params[:id])
        redirect "/"
    end
end
