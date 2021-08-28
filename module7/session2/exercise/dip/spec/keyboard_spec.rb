require "./keyboard"

describe Keyboard do
  describe "#name" do
    it "have a name" do
      keyboard = Keyboard.new
      expect(keyboard.name).to eq("keyboard")
    end
  end

  describe "#read(input)" do
    it "can read" do
      keyboard = Keyboard.new
      expect(keyboard.read("hello")).to eq("keyboard read hello")
    end
  end
end
