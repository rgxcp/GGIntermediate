require "./printer"

describe Printer do
  describe "#write(input, reader_name)" do
    it "can write" do
      printer = Printer.new
      expect(printer.write("SOLID Principles", "keyboard")).to eq("printer prints 'SOLID Principles' from keyboard")
    end
  end
end
