class AddFieldsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :assigned_to, :integer
    add_column :projects, :assigned_by, :integer
    add_column :projects, :user_id, :integer
  end
end
