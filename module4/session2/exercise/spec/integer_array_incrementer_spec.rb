require_relative "../integer_array_incrementer"

describe IntegerArrayIncrementer do
    it "should return [1] when input is [0]" do
        iai = IntegerArrayIncrementer.new
        output = iai.increment([0])
        expect(output).to eq([1])
    end

    it "should return [2] when input is [1]" do
        iai = IntegerArrayIncrementer.new
        output = iai.increment([1])
        expect(output).to eq([2])
    end
end
