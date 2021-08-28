require "./employee"
require "./pay_determiner"

describe PayDeterminer do
  describe "#compute_pay" do
    it "can calculate pay level 1" do
      employee = Employee.new("John", "Doe", 1, 0.2)
      pay_determiner = PayDeterminer.new(employee)
      expect(pay_determiner.compute_pay).to eq(2400000)
    end

    it "can calculate pay level 2" do
      employee = Employee.new("John", "Doe", 2, 0.2)
      pay_determiner = PayDeterminer.new(employee)
      expect(pay_determiner.compute_pay).to eq(3200000)
    end

    it "can calculate pay level 3" do
      employee = Employee.new("John", "Doe", 3, 0.2)
      pay_determiner = PayDeterminer.new(employee)
      expect(pay_determiner.compute_pay).to eq(4000000)
    end

    it "return error for unknown level" do
      employee = Employee.new("John", "Doe", 4, 0.2)
      pay_determiner = PayDeterminer.new(employee)
      expect(pay_determiner.compute_pay).to eq("unknown level")
    end
  end
end
