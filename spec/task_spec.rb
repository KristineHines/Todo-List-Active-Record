require 'spec_helper'
require 'rspec'
require 'date'

require_relative '../app/models/task'

describe Task, "Check Task Table" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:tasks).should be_true
    Task.delete_all

    @task = Task.new
    @task.assign_attributes(
      :id => 1
      :description => "Walk My Dog",
      :completed => false,
      :list_id => 1
    )
  end

    @task1 = Task.new
    @task1.assign_attributes(
      :id => 1
      :description => "Walk My Dog",
      :completed => true,
      :list_id => 1
    )
  end

    @task2 = Task.new
      @task2.assign_attributes(
      :id => 11
      :description => "Pick up Laundry",
      :completed => true,
      :list_id => 1
    )
  end

  it "should display for Uncompleted task" do
    @task.to_s.should == "2. [ ] Walk My Dog"
  end

  it "should display for Completed task" do
    @task.to_s.should == "2. [X] Walk My Dog"
  end

  it "should display for Completed 2digit task" do
    @task.to_s.should == "12.[X] Pick up Laundry"
  end

end
