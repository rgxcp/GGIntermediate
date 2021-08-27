# BAD
def total_income_in(start_date, end_date, reports)
  # Code
end

def total_expense_in(start_date, end_date, reports)
  # Code
end

def total_net_income_in(start_date, end_date, reports)
  # Code
end

# GOOD
def total_income_in(date_range, reports)
  # Code
end

def total_expense_in(date_range, reports)
  # Code
end

def total_net_income_in(date_range, reports)
  # Code
end

class DateRange
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  # Code
end
