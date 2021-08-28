class Triangle
  def initialize(base, height)
    @base = base
    @height = height
  end

  def calculate_area
    @base * @height * 0.5
  end
end
