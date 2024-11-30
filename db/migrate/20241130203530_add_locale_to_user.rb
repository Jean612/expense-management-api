class AddLocaleToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :locale, :string, default: 'es-PE'
  end
end
