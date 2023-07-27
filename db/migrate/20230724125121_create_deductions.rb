class CreateDeductions < ActiveRecord::Migration[6.1]
  def change
    create_table :deductions do |t|
      t.decimal :pf, precision: 10, scale: 2
      t.decimal :esic, precision: 10, scale: 2
      t.decimal :tds, precision: 10, scale: 2
      t.decimal :professional_tax, precision: 10, scale: 2
      t.decimal :gratuity, precision: 10, scale: 2
      t.decimal :income_tax, precision: 10, scale: 2
      t.decimal :old_regime, precision: 10, scale: 2
      t.decimal :new_regime, precision: 10, scale: 2
      t.decimal :leave_deduction, precision: 10, scale: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
