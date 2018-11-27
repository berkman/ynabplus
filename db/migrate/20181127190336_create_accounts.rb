class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_id
      t.string :name
      t.string :type
      t.boolean :on_budget
      t.boolean :closed
      t.string :note
      t.decimal :balance
      t.decimal :cleared_balance
      t.decimal :uncleared_balance
      t.string :transfer_payee_id
      t.boolean :deleted
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
