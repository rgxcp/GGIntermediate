require "./reader"

class Scanner < Reader
  def name
    "scanner"
  end

  def read(input)
    "scanner read #{input}"
  end
end
