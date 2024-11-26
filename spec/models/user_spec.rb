# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  email         :string           not null
#  name          :string           not null
#  password_hash :string
#  password_salt :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
