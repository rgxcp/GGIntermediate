require "./circle"
require "./rectangle"
require "./shape_calculator"
require "./triangle"

describe ShapeCalculator do
  describe "#calculate_area" do
    it "can calculate the area of a rectangle" do
      rectangle = Rectangle.new(2, 3)
      shape_calculator = ShapeCalculator.new
      expect(shape_calculator.calculate_area(rectangle)).to eq(6)
    end

    it "can calculate the area of a triangle" do
      triangle = Triangle.new(2, 3)
      shape_calculator = ShapeCalculator.new
      expect(shape_calculator.calculate_area(triangle)).to eq(3)
    end

    it "can calculate the area of a circle" do
      circle = Circle.new(5)
      shape_calculator = ShapeCalculator.new
      expect(shape_calculator.calculate_area(circle)).to eq(78.5)
    end
  end
end
