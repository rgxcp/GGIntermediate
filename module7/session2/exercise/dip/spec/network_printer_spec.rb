require "./network_printer"

describe NetworkPrinter do
  describe "#write(input, reader_name)" do
    it "can write" do
      network_printer = NetworkPrinter.new
      expect(network_printer.write("SOLID Principles", "scanner")).to eq("network printer prints 'SOLID Principles' from scanner")
    end
  end
end
