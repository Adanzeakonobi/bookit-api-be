class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Vehicle

    return unless user.present?

    can %i[read create], Reservation, user: user
    can %i[create update], Vehicle

    return unless user.admin?

    can :manage, :all
  end
end
