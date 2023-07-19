class ChangeFromTimeAndToTimeDataTypes < ActiveRecord::Migration[6.1]
  def change
    change_column :leaves, :from_time, :string
    change_column :leaves, :to_time, :string
  end
end
