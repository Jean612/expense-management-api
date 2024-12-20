class CreateCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :slug
      t.string :color
      t.string :icon
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
