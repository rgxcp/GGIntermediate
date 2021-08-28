require "./employee"

describe Employee do
  describe "#full_name" do
    it "can get full name" do
      employee = Employee.new("John", "Doe", 3, 0.2)
      expect(employee.full_name).to eq("John Doe")
    end
  end
end
