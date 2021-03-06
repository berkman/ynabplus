class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :budget_id
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
