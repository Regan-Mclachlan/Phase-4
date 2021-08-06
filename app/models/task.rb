class Task < ApplicationRecord
    has_many :task_groups
    has_many :groups, through: :task_groups 
    has_many :users, through: :groups
end
