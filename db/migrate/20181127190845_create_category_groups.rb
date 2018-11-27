class CreateCategoryGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :category_groups do |t|
      t.string :category_group_id
      t.string :name
      t.boolean :hidden
      t.boolean :deleted
      t.references :budget, foreign_key: true

      t.timestamps
    end
  end
end
