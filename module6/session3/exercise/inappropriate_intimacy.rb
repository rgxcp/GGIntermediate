# BAD
class Report
  attr_reader :income, :expense, :tax, :date

  def initialize(income, expense, type, date)
    @income = income
    @expense = expense
    @tax = Tax.new(type)
    @date = date
  end
end

income_tax = report.tax.income_tax(gross_income)

# GOOD
class Report
  attr_reader :income, :expense, :type, :date

  def initialize(income, expense, type, date)
    @income = income
    @expense = expense
    @tax = Tax.new(type)
    @date = date
  end

  def income_tax
    @tax.income_tax(@income)
  end
end

income_tax = report.income_tax
