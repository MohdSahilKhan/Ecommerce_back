class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.decimal :working_hours
      t.string :task_status
      t.references :project, null: false, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.text :task_description
      t.decimal :billing_hours

      t.timestamps
    end
  end
end
