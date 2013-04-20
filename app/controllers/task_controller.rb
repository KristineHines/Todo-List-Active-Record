require_relative '../../config/application'

class TaskController

  def analyze_input(user_input) 
    if user_input[0] == "add"
      create_task(user_input[1..-1])

    elsif user_input[0] == "delete"
      delete_task(user_input[1..-1])

    elsif user_input[0] == "complete"
      complete_task(user_input[1..-1])

    elsif user_input[0] == "uncomplete"
      uncomplete_task(user_input[1..-1])

    elsif user_input[0] == "list"
      show_list
    end
  end

  def create_task(user_input)
    description = user_input.join(' ')
    Task.create(:description => description, :completed => false).save
    TaskView.create_view(description)
  end

  def complete_task(task_id)
    Task.update(task_id.first, :completed => true)
    TaskView.complete(task_id.first)
  end

  def uncomplete_task(task_id)
    Task.update(task_id.first, :completed => false)
    TaskView.uncomplete(task_id.first)
  end

  def delete_task(task_id)
    TaskView.delete(task_id)
    Task.destroy(task_id)
  end

  def show_list
    TaskView.show_list(Task.all)
  end

end

