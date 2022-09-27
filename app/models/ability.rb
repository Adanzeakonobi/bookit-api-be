class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Vehicle, visible: true

    return unless user.present?

    can %i[read create], Reservation, user: user

    return unless user.admin?

    can :manage, :all
  end
end
