require "./ostrich"

describe Ostrich do
  describe "#sound" do
    it "can sound" do
      ostrich = Ostrich.new
      expect(ostrich.sound).to eq("bark")
    end
  end

  context "calling undefined method" do
    it "won't fly" do
      ostrich = Ostrich.new
      expect { ostrich.fly }.to raise_error(NoMethodError)
    end
  end
end
