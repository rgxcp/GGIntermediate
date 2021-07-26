require_relative "../wli"

describe WLI do
    it "zero person" do
        wli = WLI.new
        likes = wli.likes
        expect(likes).to eq("No one likes this")
    end

    it "one person" do
        wli = WLI.new
        wli.names = ["Peter"]
        likes = wli.likes
        expect(likes).to eq("Peter likes this")
    end

    it "two people" do
        wli = WLI.new
        wli.names = ["Jacob", "Alex"]
        likes = wli.likes
        expect(likes).to eq("Jacob and Alex like this")
    end

    it "three people" do
        wli = WLI.new
        wli.names = ["Max", "John", "Mark"]
        likes = wli.likes
        expect(likes).to eq("Max, John, and Mark like this")
    end

    it "gte four people" do
        wli = WLI.new
        wli.names = ["Alex", "Jacob", "Mark", "Max"]
        likes = wli.likes
        expect(likes).to eq("Alex, Jacob, and 2 others like this")
    end
end
