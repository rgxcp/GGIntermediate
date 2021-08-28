require "./triangle"

describe Triangle do
  describe "#calculate_area" do
    it "should return 75 when base is 10 and height is 15" do
      triangle = Triangle.new(10, 15)
      expect(triangle.calculate_area).to eq(75)
    end
  end
end
