require "./circle"

describe Circle do
  describe "#calculate_area" do
    it "should return 78.5 when radius is 5" do
      circle = Circle.new(5)
      expect(circle.calculate_area).to eq(78.5)
    end
  end
end
