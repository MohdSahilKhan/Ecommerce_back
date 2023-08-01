class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gender, :string  
    add_column :users, :city, :string  
    add_column :users, :pincode, :string  
    add_column :users, :state, :string  
    add_column :users, :address, :string  
    remove_column :users, :location, :string  
    remove_column :users, :emergency_contact, :string  
  end
end
