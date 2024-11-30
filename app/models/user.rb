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

  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :payment_methods, dependent: :destroy

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

  def api_token
    payload = { "user-id": id, exp: Time.zone.now.to_i + 7.days.to_i }
    JWT.encode(payload, ENV['JWT_SECRET_KEY'], 'HS256')
  end

  def api_token_expired?(token)
    decoded_token = JWT.decode(token, ENV['JWT_SECRET_KEY'], true, algorithm: 'HS256').first
    Time.zone.now.to_i >= Time.zone.at(decoded_token[:exp]).to_i
  end
end
