# We define user permisstion with the Ability class
class Ability
  include CanCan::Ability
  # Permissions can be mdified based on any user attributes
  def initialize(user)
    user ||= User.new #guest user (not logged in)
    can :manage, User, id: user.id # :manage is the action fo the argument
    # can :manage matches any action on the User contoller
    # perfom any action with a User object.
  end
end
