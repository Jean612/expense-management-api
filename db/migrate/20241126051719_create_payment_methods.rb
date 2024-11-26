class CreatePaymentMethods < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_methods do |t|
      t.string :name, null: false
      t.string :bank
      t.boolean :cash, default: true
      t.boolean :credit_card, default: false
      t.boolean :debit_card, default: false
      t.boolean :digital_wallet, default: false
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
