# == Schema Information
#
# Table name: expenses
#
#  id                :bigint           not null, primary key
#  amount            :decimal(22, 2)
#  currency          :string
#  date              :date
#  description       :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint
#  payment_method_id :bigint
#  user_id           :bigint           not null
#
# Indexes
#
#  index_expenses_on_amount             (amount)
#  index_expenses_on_category_id        (category_id)
#  index_expenses_on_currency           (currency)
#  index_expenses_on_date               (date)
#  index_expenses_on_payment_method_id  (payment_method_id)
#  index_expenses_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (payment_method_id => payment_methods.id)
#  fk_rails_...  (user_id => users.id)
#
class Expense < ApplicationRecord
  # enum :currency, { usd: 0, pen: 1, eur: 2 }, validate: true
  belongs_to :category, optional: true
  belongs_to :payment_method, optional: true
  belongs_to :user

  validates :description, presence: true
  validates :amount, presence: true
  validates :date, presence: true
  validates :currency, presence: true
end
