# We define user permisstion with the Ability class
class Ability
  include CanCan::Ability
  # Permissions can be mdified based on any user attributes
  def initialize(user)
    user ||= User.new #guest user (not logged in)
    if user.admin?
       can :manage, :all
    else
      can :read, :all   
      can [:update, :destroy], User, id: user.id 
      # can :read, Comment, id: user.id
      # can :read, Product, id: user.id
    end  
  end
end
