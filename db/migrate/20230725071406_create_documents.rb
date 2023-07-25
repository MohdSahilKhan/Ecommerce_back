class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :resume
      t.string :aadhar
      t.string :pan
      t.string :passport
      t.string :relieving_letter
      t.string :experience_letter
      t.string :bank_statement_3_mon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
