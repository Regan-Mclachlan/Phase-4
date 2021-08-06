class CreateTaskGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :task_groups do |t|
      t.references :task, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
