class RemoveofficialEmailFromusers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :official_email, :string
  end
end
