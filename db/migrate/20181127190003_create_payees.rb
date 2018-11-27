class CreatePayees < ActiveRecord::Migration[5.2]
  def change
    create_table :payees do |t|
      t.string :payee_id
      t.string :name
      t.string :transfer_account_id
      t.boolean :deleted
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
