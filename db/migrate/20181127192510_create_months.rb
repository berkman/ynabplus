class CreateMonths < ActiveRecord::Migration[5.2]
  def change
    create_table :months do |t|
      t.string :month
      t.string :note
      t.integer :income
      t.integer :budgeted
      t.integer :activity
      t.integer :to_be_budgeted
      t.integer :age_of_money
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
