class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :domain
      t.date :start_date
      t.decimal :rate
      t.string :currency
      t.string :project_type

      t.timestamps
    end
  end
end
