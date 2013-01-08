module ProjectsHelper
  def task_class(task)
    if task.expired?
      ' expired'
    elsif task.is_done
      ' done'
    else
      ''
    end
  end
end
