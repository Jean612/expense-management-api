class AddIndexesOnTables < ActiveRecord::Migration[8.0]
  def change
    add_index :categories, :slug
    add_index :payment_methods, :slug
    add_index :expenses, :date
    add_index :expenses, :amount
    add_index :expenses, :currency
    add_index :users, :email
    add_index :users, :active
    #Ex:- add_index("admin_users", "username")
  end
end
