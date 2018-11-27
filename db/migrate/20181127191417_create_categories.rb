class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category_id
      t.references :category_group, foreign_key: true
      t.string :name
      t.boolean :hidden
      t.string :original_category_group_id
      t.string :note
      t.integer :budgeted
      t.integer :activity
      t.integer :balance
      t.string :goal_type
      t.boolean :deleted
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
