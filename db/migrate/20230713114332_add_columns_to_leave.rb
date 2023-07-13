class AddColumnsToLeave < ActiveRecord::Migration[6.1]
  def change
    add_column :leaves, :from_time, :datetime
    add_column :leaves, :to_time, :datetime
    add_column :leaves, :consumed_leave, :integer
  end
end
