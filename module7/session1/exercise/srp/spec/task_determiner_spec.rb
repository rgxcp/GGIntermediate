require "./task_determiner"

describe TaskDeterminer do
  describe "#task(date, employee_name)" do
    it "can determine monday task" do
      task_determiner = TaskDeterminer.new
      expect(task_determiner.task("monday", "John Doe")).to eq("John Doe implement birthday calculator")
    end

    it "can determine wednesday task" do
      task_determiner = TaskDeterminer.new
      expect(task_determiner.task("wednesday", "John Doe")).to eq("John Doe add birthday entries")
    end

    it "can have default task task" do
      task_determiner = TaskDeterminer.new
      expect(task_determiner.task("friday", "John Doe")).to eq("John Doe will fix issues")
    end
  end
end
