require_relative "../../app/controller/categories_controller"

describe CategoriesController do
    context ".index" do
        it "will return index page" do
            result = ERB.new(File.read("app/views/categories/index.erb"))
            expect(result).to eq(CategoriesController.index)
        end
    end

    context ".new" do
        it "will return new page" do
            result = ERB.new(File.read("app/views/categories/new.erb"))
            expect(result).to eq(CategoriesController.new)
        end
    end

    context ".edit(id)" do
        it "will return edit page" do
            result = ERB.new(File.read("app/views/categories/edit.erb"))
            expect(result).to eq(CategoriesController.edit(1))
        end
    end

    context ".create(params)" do
        context "with valid input" do
            it "will return true" do
                result = CategoriesController.create({
                    :name => "Name"
                })
                expect(result).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                result = CategoriesController.create({
                    :name => nil
                })
                expect(result).to be_falsey
            end
        end
    end

    context ".update(params)" do
        context "with valid input" do
            it "will return true" do
                result = CategoriesController.create({
                    id: 1,
                    :name => "Name"
                })
                expect(result).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                result = CategoriesController.create({
                    id: nil,
                    :name => nil
                })
                expect(result).to be_falsey
            end
        end
    end

    context ".destroy(id)" do
        it "will return true" do
            result = CategoriesController.destroy(1)
            expect(result).to be_truthy
        end
    end
end
