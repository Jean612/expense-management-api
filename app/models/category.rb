# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  color      :string
#  icon       :string
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_categories_on_slug     (slug)
#  index_categories_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Category < ApplicationRecord
  # enum :icon, Constants::Icons::LUCIDA_ICONS.map(&:to_sym), default: Constants::Icons::LUCIDA_ICONS.map(&:to_sym).sample
  belongs_to :user
  has_many :expenses, dependent: :nullify

  validates :name, presence: true
  validates :color, presence: true

  after_save :update_slug

  private

  def update_slug
    update_column(:slug, "#{name.parameterize}-#{id}-#{user_id}") # rubocop:disable Rails/SkipsModelValidations
  end
end
