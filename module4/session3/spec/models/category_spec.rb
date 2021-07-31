require_relative "../../app/models/category"

describe Category do
    context ".all" do
        it "will return array" do
            category = Category.all
            expect(category).to be_kind_of(Array)
        end
    end

    context ".find(id)" do
        it "will return category object" do
            category = Category.find(1)
            expect(category).to be_kind_of(Category)
        end
    end

    context ".create(params)" do
        context "with valid input" do
            it "will return true" do
                category = Category.create({
                    :name => "Name"
                })
                expect(category).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                category = Category.create({
                    :name => nil
                })
                expect(category).to be_falsey
            end
        end
    end

    context ".update(params)" do
        context "with valid input" do
            it "will return true" do
                category = Category.create({
                    :id => 1,
                    :name => "Name"
                })
                expect(category).to be_truthy
            end
        end

        context "with invalid input" do
            it "will return false" do
                category = Category.create({
                    :id => nil,
                    :name => nil
                })
                expect(category).to be_falsey
            end
        end
    end

    context ".destroy(id)" do
        it "will return true" do
            category = Category.destroy(1)
            expect(category.delete).to be_truthy
        end
    end
end
