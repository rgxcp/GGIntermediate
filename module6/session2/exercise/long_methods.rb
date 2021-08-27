# BAD
def get_total_net_income(reports)
  total_net_income = 0

  reports.each do |report|
    gross_income = report.income - report.expense
    net_income = report.tax.income_tax(gross_income)
    total_net_income = total_net_income + net_income
  end

  total_net_income
end

# GOOD (1)
def get_total_net_income(reports)
  total_net_income = 0

  reports.each do |report|
    gross_income = get_gross_income(report)
    total_net_income += get_net_income(report, gross_income)
  end

  total_net_income
end

def get_gross_income(report)
  report.income - report.expense
end

def get_net_income(report, gross_income)
  report.tax.income_tax(gross_income)
end

# GOOD (2)
def get_total_net_income(reports)
  reports.sum { |report| get_net_income(report) }
end

def get_net_income(report)
  gross_income = report.income - report.expense
  net_income = gross_income - report.tax.income_tax(gross_income)
  net_income
end
