require_relative "flying_bird"

class Duck < FlyingBird
  def sound
    "quack"
  end

  def fly
    "flying as a duck"
  end
end
