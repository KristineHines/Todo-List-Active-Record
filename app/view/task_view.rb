require_relative '../../config/application'

class TaskView
  def self.delete(task_id)
    puts "You deleted task #{task_id.first}"
  end


  def self.create_view(task)
    puts "You created the task #{task}!"
  end

  def self.show_list(list)
    puts "HERE IS YOUR FREAKING LIST!!!!!!!!!!!"

    list.each_with_index do |task, index|
      if task.completed
        puts "#{index + 1}.".ljust(3) + "[X] #{task.description}\n"
      else
        puts "#{index + 1}.".ljust(3) + "[ ] #{task.description}\n"
      end
    end
  end

  def self.uncomplete(task)
    puts "You have uncompleted this task: #{task}!"
  end

  def self.complete(task)
    puts "You have completed this task: #{task}!"
  end
end