class CreateLeaves < ActiveRecord::Migration[6.1]
  def change
    create_table :leaves do |t|
      t.integer :leave_balance
      t.string :leave_type
      t.date :from_date
      t.date :to_date
      t.string :leave_status
      t.text :reason
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
