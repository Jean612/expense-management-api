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
require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
