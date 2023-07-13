class RemoveLeaveDetailsFromLeave < ActiveRecord::Migration[6.1]
  def change
    remove_column :leaves, :leave_details, :string
  end
end
