class CreateStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :statuses do |t|
      t.string :to
      t.string :cc
      t.datetime :status_date

      t.timestamps
    end
  end
end
