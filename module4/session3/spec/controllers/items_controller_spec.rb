require_relative "../../app/controller/items_controller"

describe ItemsController do
    context ".index" do
        it "will return index page" do
            result = ERB.new(File.read("app/views/items/index.erb"))
            expect(result).to eq(ItemsController.index)
        end
    end

    context ".new" do
        it "will return new page" do
            result = ERB.new(File.read("app/views/items/new.erb"))
            expect(result).to eq(ItemsController.new)
        end
    end

    context ".show(id)" do
        it "will return show page" do
            result = ERB.new(File.read("app/views/items/show.erb"))
            expect(result).to eq(ItemsController.show(1))
        end
    end

    context ".edit(id)" do
        it "will return edit page" do
            result = ERB.new(File.read("app/views/items/edit.erb"))
            expect(result).to eq(ItemsController.edit(1))
        end
    end

    context ".create(params)" do
        context "with valid input" do
            it "will return true" do
                result = ItemsController.create({
                    :name => "Name",
                    :price => 7000,
                    :category_ids => [1, 2, 3]
                })
                expect(result).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                result = ItemsController.create({
                    :name => nil,
                    :price => nil,
                    :category_ids => nil
                })
                expect(result).to be_falsey
            end
        end
    end

    context ".update(params)" do
        context "with valid input" do
            it "will return true" do
                result = ItemsController.create({
                    :id => 1
                    :name => "Name",
                    :price => 7000,
                    :category_ids => [1, 2, 3]
                })
                expect(result).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                result = ItemsController.create({
                    :id => nil,
                    :name => nil,
                    :price => nil,
                    :category_ids => nil
                })
                expect(result).to be_falsey
            end
        end
    end

    context ".destroy(id)" do
        it "will return true" do
            result = ItemsController.destroy(1)
            expect(result).to be_truthy
        end
    end
end
