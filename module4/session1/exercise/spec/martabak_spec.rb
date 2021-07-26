require_relative "../martabak"

describe Martabak do
    it "is delicious" do
        martabak = Martabak.new("chocolate")
        taste = martabak.taste
        expect(taste).to eq("Martabak chocolate is delicious")
    end
end
