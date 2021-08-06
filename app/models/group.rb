class Group < ApplicationRecord
  has_many :user_groups
  has_many :task_groups
  has_many :users, through: :user_groups
  has_many :tasks, through: :task_groups
end
