require "./rectangle"

describe Rectangle do
  describe "#calculate_area" do
    it "should return 20 when length is 10 and width is 2" do
      rectangle = Rectangle.new(10, 2)
      expect(rectangle.calculate_area).to eq(20)
    end
  end
end
