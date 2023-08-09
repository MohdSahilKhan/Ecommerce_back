class AddDesignationAndEmergencyContactToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :designation, :string
    add_column :users, :emergency_contact_no, :string
  end
end
