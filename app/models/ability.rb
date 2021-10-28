# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user.it_admin?
      can :manage, User
      cannot :manage, Inventory
    end

    if user.inventory_manager?
      cannot :manage, User
      can :manage, Inventory
    end

    if user.quality_check_person?
      cannot :manage, User
      cannot [:new, :create, :destroy], Inventory
      can :update, Inventory, :attributes => [ :qa_status ]
    end

    if user.sales_manager?
      can :read, Inventory
      can :read, User, role: "sales_manager"
    end

  end
end
