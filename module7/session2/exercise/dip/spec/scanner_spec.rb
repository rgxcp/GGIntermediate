require "./scanner"

describe Scanner do
  describe "#name" do
    it "have a name" do
      scanner = Scanner.new
      expect(scanner.name).to eq("scanner")
    end
  end

  describe "#read(input)" do
    it "can read" do
      scanner = Scanner.new
      expect(scanner.read("hello")).to eq("scanner read hello")
    end
  end
end
