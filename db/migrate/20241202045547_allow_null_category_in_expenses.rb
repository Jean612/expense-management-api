class AllowNullCategoryInExpenses < ActiveRecord::Migration[8.0]
  def change
    change_column_null :expenses, :category_id, true
    change_column_null :expenses, :payment_method_id, true
  end
end
