require('rspec')
require('task')
require('pry')
require('pg')

describe(Task) do
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#save") do
      it("adds a task to the array of saved tasks") do
        test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2018-03-27 00:00:00"})
        test_task.save()
        expect(Task.all()).to(eq([test_task]))
      end
    end

  describe("#description") do
    it("lets you read the decription out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2018-02-28 00:00:00"})
      expect(test_task.description()).to(eq("learn SQL"))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2018-02-20 00:00:00"})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2018-03-27 00:00:00"})
      task2 = Task.new({:description => "learn SQL", :list_id => 1, :due_date => "2018-03-27 00:00:00"})
      expect(task1).to(eq(task2))
    end
  end

end
