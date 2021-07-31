require_relative "../../app/controller/category_items_controller"

describe CategoryItemsController do
    context ".index(id)" do
        it "should render index page if data exist" do
            result = ERB.new(File.read("app/views/categories/items/index.erb"))
            expect(result).to eq(CategoryItemsController.index(1))
        end

        it "should render 404 page if data doesn't exist" do
            result = ERB.new(File.read("app/views/404.erb"))
            expect(result).to eq(CategoryItemsController.index(100))
        end
    end
end
