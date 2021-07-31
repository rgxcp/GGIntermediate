require_relative "../../app/models/item"

describe Item do
    context ".all" do
        it "will return array" do
            item = Item.all
            expect(item).to be_kind_of(Array)
        end
    end

    context ".find(id)" do
        it "will return item object" do
            item = Item.find(1)
            expect(item).to be_kind_of(Item)
        end
    end

    context ".create(params)" do
        context "with valid input" do
            it "will return true" do
                item = Item.create({
                    :name => "Name",
                    :price => 7000,
                    :category_ids => [1, 2, 3]
                })
                expect(item).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                item = Item.create({
                    :name => nil,
                    :price => nil,
                    :category_ids => nil
                })
                expect(item).to be_falsey
            end
        end
    end

    context ".update(params)" do
        context "with valid input" do
            it "will return true" do
                item = Item.update({
                    :id => 1,
                    :name => "Name",
                    :price => 7000,
                    :category_ids => [1, 2, 3]
                })
                expect(item).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                item = Item.update({
                    :id => nil,
                    :name => nil,
                    :price => nil,
                    :category_ids => nil
                })
                expect(item).to be_falsey
            end
        end
    end

    context ".destroy(id)" do
        it "will return true" do
            item = Item.destroy(1)
            expect(item.delete).to be_truthy
        end
    end
end
