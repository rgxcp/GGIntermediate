# BAD
class Tax
  def income_tax(gross_income)
    case @type
    when "INDIVIDUAL"
      gross_income * 0.1
    when "ENTERPRISE"
      gross_income * 0.2
    when "GOVERNMENT"
      gross_income * 0.5
    else
      gross_income * 0.3
    end
  end
end

# GOOD
class Type
  def income_tax(gross_income)
    gross_income * 0.3
  end
end

class Enterprise < Type
  def income_tax(gross_income)
    gross_income * 0.2
  end
end

class Government < Type
  def income_tax(gross_income)
    gross_income * 0.5
  end
end

class Individual < Type
  def income_tax(gross_income)
    gross_income * 0.1
  end
end

class Tax
  def income_tax(gross_income)
    @type.income_tax(gross_income)
  end
end
