class Ability
  include CanCan::Ability

  def initialize(user)
    return if user.blank?

    # Los usuarios pueden gestionar solo sus propios recursos
    can :manage, Category, user_id: user.id
    can :manage, Expense, user_id: user.id
    can :manage, PaymentMethod, user_id: user.id
  end
end
