class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new # for guest
    @user.roles.each { |role| send(role.name) }

    if @user.roles.size == 0
      can :read, :all #for guest without roles
    end
  end

  def user
    can :manage, Devise
    can :manage, Host
    can :manage, Machine
  end

  def admin
    can :manage, Devise
    can :manage, Host
    can :manage, Machine
  end

end
