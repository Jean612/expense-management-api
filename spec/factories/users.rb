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
FactoryBot.define do
  factory :user do
    name { "MyString" }
    email { "MyString" }
    active { false }
    password_hash { "MyString" }
    password_salt { "MyString" }
  end
end
