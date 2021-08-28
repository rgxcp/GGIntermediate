require "./duck"

describe Duck do
  describe "#sound" do
    it "can sound" do
      duck = Duck.new
      expect(duck.sound).to eq("quack")
    end
  end

  describe "#fly" do
    it "will fly" do
      duck = Duck.new
      expect(duck.fly).to eq("flying as a duck")
    end
  end
end
