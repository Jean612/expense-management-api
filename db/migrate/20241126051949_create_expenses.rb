class CreateExpenses < ActiveRecord::Migration[8.0]
  def change
    create_table :expenses do |t|
      t.string :description, null: false
      t.decimal :amount, precision: 22, scale: 2
      t.string :currency
      t.date :date
      t.references :category, null: false, foreign_key: true
      t.references :payment_method, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
