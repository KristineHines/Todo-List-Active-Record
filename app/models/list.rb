require_relative '../../config/application.rb'

class List < ActiveRecord::Base
  has_many :tasks

end


# create a new task
# add task to task table
# task needs list id
