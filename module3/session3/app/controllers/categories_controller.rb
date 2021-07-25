require_relative "application_controller"
require_relative "../models/category"

class CategoriesController < ApplicationController
    get "/categories" do
        @categories = Category.all
        erb :"categories/index"
    end

    get "/categories/new" do
        erb :"categories/new"
    end

    get "/categories/:id/edit" do
        @category = Category.find(params[:id])
        erb :"categories/edit"
    end

    post "/categories" do
        Category.create(params[:name])
        redirect "/categories"
    end

    put "/categories/:id" do
        Category.update(params)
        redirect "/categories"
    end

    delete "/categories/:id" do
        Category.destroy(params[:id])
        redirect "/categories"
    end
end
