class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin_role?
      can :manage_users, :all
    else
      can :read, :all
    end
  end
end
