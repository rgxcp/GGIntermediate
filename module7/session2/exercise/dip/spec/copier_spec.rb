require "./copier"
require "./keyboard"
require "./network_printer"
require "./printer"
require "./scanner"

describe Copier do
  describe "#copy(input, reader, writer)" do
    it "can prints from keyboard using printer" do
      copier = Copier.new
      reader = Keyboard.new
      writer = Printer.new
      expect(copier.copy("SOLID Principles", reader, writer)).to eq("printer prints 'SOLID Principles' from keyboard")
    end

    it "can prints from scanner using network printer" do
      copier = Copier.new
      reader = Scanner.new
      writer = NetworkPrinter.new
      expect(copier.copy("SOLID Principles", reader, writer)).to eq("network printer prints 'SOLID Principles' from scanner")
    end
  end
end
