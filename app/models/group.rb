class Group < ApplicationRecord
  has_many :user_groups
  has_many :task_groups
  has_many :users, through: :user_groups
  has_many :tasks, through: :task_groups

  def tasks_completed
    self.tasks.filter {|task| task.status == "Completed"}
  end
  def tasks_in_progress
    self.tasks.filter {|task| task.status == "In Progress"}
  end
  def tasks_incomplete
    self.tasks.filter {|task| task.status == "Incomplete"}
  end
end
