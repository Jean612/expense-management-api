# == Schema Information
#
# Table name: users
#
#  id            :bigint           not null, primary key
#  active        :boolean          default(TRUE)
#  email         :string           not null
#  locale        :string           default("es-PE")
#  name          :string           not null
#  password_hash :string
#  password_salt :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_active  (active)
#  index_users_on_email   (email)
#
class User < ApplicationRecord
  attr_accessor :password

  enum :locale, Constants::Locale::AVAILABLE_LOCALES.keys

  scope :active, -> { where(active: true) }
  scope :with_valid_email, -> { where.not(email: ['', nil]).where("email LIKE '%_@__%.__%'") }

  before_save :encrypt_password, :verify_email
  before_validation { email.try(:downcase!) }

  validates :password, confirmation: true
  validates :password, presence: { on: :create }
  validates :password, length: { minimum: 6, allow_blank: true }
  validates :email, presence: true, uniqueness: { allow_blank: true } # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: :not_valid, allow_blank: true }

  def verify_email
    self.email = email.to_s.delete(" \t").downcase
  end

  def valid_password?(password)
    password_hash == BCrypt::Engine.hash_secret(password, password_salt)
  end

  def encrypt_password
    return if password.blank?

    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
  end

  def graphql_token
    payload = { "user-id": id }
    JWT.encode(payload, ENV['JWT_SECRET_KEY'], 'HS256')
  end
end
