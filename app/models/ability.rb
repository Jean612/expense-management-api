# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :create, Session

    return if user.blank?

    ## User
    # Category
    can %i[read update destroy], Category, user: user
  end
end
