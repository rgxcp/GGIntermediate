class PayDeterminer
  def initialize(employee)
    @employee = employee
  end

  def compute_pay
    case @employee.working_level
    when 1
      3000000 - (3000000 * @employee.tax)
    when 2
      4000000 - (4000000 * @employee.tax)
    when 3
      5000000 - (5000000 * @employee.tax)
    else
      "unknown level"
    end
  end
end
