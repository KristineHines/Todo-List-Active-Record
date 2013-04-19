require 'rspec'
require_relative '../db/config'


describe "create table with correct schema" do

  before (:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Migrator.current_version > 0
  end


  it "should have a Tasks table" do
    ActiveRecord::Base.connection.table_exists?(:tasks).should be_true
  end

  it "should have a Lists table" do
    ActiveRecord::Base.connection.table_exists?(:lists).should be_true
  end

  it "Tasks should have the right columns and types" do
    expected = {
      :integer => ["id", "list_id"],
      :string => ["description"],
      :boolean => ["completed"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:tasks).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end

  it "Lists should have the right columns and types" do
    expected = {
      :integer => ["id"],
      :string => ["name"],
      :datetime => ["created_at", "updated_at"]
    }

    ActiveRecord::Base.connection.columns(:lists).each do |col|
      expected[col.type].include?(col.name).should be_true
    end
  end
end


