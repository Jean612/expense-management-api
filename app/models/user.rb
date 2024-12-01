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
class User < ApplicationRecord
  enum :locale, Constants::Locale::AVAILABLE_LOCALES.keys

  # Validaciones
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }, on: :create
  validates :email, presence: true, uniqueness: { allow_blank: true } # rubocop:disable Rails/UniqueValidationWithoutIndex
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: :not_valid, allow_blank: true }

  # Relaciones
  has_many :categories, dependent: :destroy
  has_many :expenses, dependent: :destroy
  has_many :payment_methods, dependent: :destroy

  # Atributos virtuales para password
  has_secure_password

  # Callbacks
  before_validation :normalize_email

  # Métodos
  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end
