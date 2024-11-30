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
    name { Faker::Name.name }
    email { Faker::Internet.email(name:) }
    active { true }
    password { Faker::Internet.password(min_length: 6) }
  end
end
