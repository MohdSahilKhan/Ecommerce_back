class AddColumnToLeave < ActiveRecord::Migration[6.1]
  def change
    add_column :leaves, :apply_to, :string
    add_column :leaves, :leave_details, :string, default: "full Day"
    change_column_default :leaves, :leave_status, "pending"
    change_column_default :leaves, :leave_balance, "40"
  end
end
