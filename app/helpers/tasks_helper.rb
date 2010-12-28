module TasksHelper
  def display_time_left(task)
    if task.deadline < Date.today
      time_left = 'was due ' + distance_of_time_in_words(Time.now, task.deadline, false) + ' ago'
    elsif
      time_left = 'will be due in ' + distance_of_time_in_words(Time.now, task.deadline, false)
    end
    time_left
  end
end
