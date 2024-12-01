# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  active          :boolean          default(TRUE)
#  email           :string           not null
#  locale          :string           default(NULL)
#  name            :string           not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_active  (active)
#  index_users_on_email   (email)
#
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email(name:) }
    active { true }
    password { Faker::Internet.password(min_length: 6) }
  end
end
