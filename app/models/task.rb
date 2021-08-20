class Task < ApplicationRecord
    has_many :task_groups
    has_many :groups, through: :task_groups 
    has_many :users, through: :groups

    scope :tasks_completed, -> { where(status: "Completed")}

    # def self.tasks_completed
    #     Task.where status: "Completed"
    # end


    def self.tasks_in_progress
        Task.where status: "In Progress"
    end

    def self.tasks_incomplete
        Task.where status: "Incomplete"
    end
end
