require 'spec_helper'
require 'rspec'
require 'date'

require_relative '../app/models/task'

describe Task, "Validate Task Methods" do
  
   before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:tasks).should be_true
    Task.delete_all

    
    @list = List.create(name: 'I am a list') 
    puts @list.object_id
   end
  

  context "The task has a list and description" do    
    
    it "is valid" do
    task = Task.new(description: 'I am a task', list_id: @list.id)
      task.should be_valid
    end
  end

  context "The task is missing a list_id" do 
    it "should be not valid" do 
      task = Task.new(description: 'I am a task') 
      task.should_not be_valid
    end
  end

  context "The task should display for uncompleted task" do
    it "should show" do
      task = Task.create(description: 'Walk My Dog', completed: false, list_id: @list.id) 
      task.to_s.should == "#{task.id+1}.".ljust(3) + "[ ] Walk My Dog"
    end
  end

  context "The task should display for completed task" do
    it "should show" do
      task = Task.create(description: 'Make Memes of my face son', completed: true, list_id: @list.id ) 
      task.to_s.should == "#{task.id+1}.".ljust(3) + "[X] Make Memes of my face son" 
      end
    end

  context "The task should validate an updated task" do
    
    it "should show" do
      task = Task.create(description: 'Make Memes of my face son', completed: true, list_id: @list.id ) 
      new_task = "Naw son, no more memes"
      task.description = "Naw son, no more memes"
      task.description.should == new_task
      end
    end

end
