require_relative "application_controller"
require_relative "../models/category"

class CategoryItemsController < ApplicationController
    get "/categories/:id/items" do
        @category_items = Category.items(params[:id])
        erb :"categories/items/index"
    end
end
