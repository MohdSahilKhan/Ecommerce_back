class CreateSalaryInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :salary_infos do |t|
      t.decimal :basic_salary, precision: 10, scale: 2
      t.decimal :hra, precision: 10, scale: 2
      t.decimal :allowance_medical, precision: 10, scale: 2
      t.decimal :allowance_special, precision: 10, scale: 2
      t.decimal :incentives, precision: 10, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
