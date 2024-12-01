# == Schema Information
#
# Table name: payment_methods
#
#  id             :bigint           not null, primary key
#  bank           :string
#  cash           :boolean          default(TRUE)
#  credit_card    :boolean          default(FALSE)
#  debit_card     :boolean          default(FALSE)
#  digital_wallet :boolean          default(FALSE)
#  name           :string           not null
#  slug           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_payment_methods_on_slug     (slug)
#  index_payment_methods_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :payment_method do
    association :user

    name { Faker::Bank.name }
    bank { Faker::Bank.name }
    cash { false }
    credit_card { true }
  end
end
