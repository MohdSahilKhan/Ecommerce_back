class CreateBankDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :bank_details do |t|
      t.string :account_name
      t.string :account_number
      t.string :ifsc
      t.string :cancelled_cheque
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
