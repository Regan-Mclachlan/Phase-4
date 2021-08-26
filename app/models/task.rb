class Task < ApplicationRecord
    has_many :task_groups
    has_many :groups, through: :task_groups 
    has_many :users, through: :groups
    # accepts_nested_attributes_for :groups


    scope :tasks_completed, -> { where(status: "Completed")}

    # def self.tasks_completed
    #     Task.where status: "Completed"
    # end
    def groups_id=(groups)
        groups.each do |group|
            group_instance = Group.find(group)
            if !self.groups.include?(group_instance)
              group_instance.tasks << self 
            end
        end
    end

    def groups_id
        self.groups.map { |group| group.id }
    end

    def self.tasks_in_progress
        Task.where status: "In Progress"
    end

    def self.tasks_incomplete
        Task.where status: "Incomplete"
    end
end
