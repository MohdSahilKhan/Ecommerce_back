class CreateJoinTableManagersUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers_users, id: false do |t|
      t.belongs_to :manager
      t.belongs_to :user
    end

    add_index :managers_users, [:manager_id, :user_id], unique: true
  end
end
