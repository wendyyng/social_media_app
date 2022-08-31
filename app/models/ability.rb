
class Ability
    include CanCan::Ability
  
    def initialize(user)
      user ||= User.new

      if user.is_admin?
        can :manage, :all # manage means they can do everything (not just CRUD)
      end
  
      alias_action :create, :read, :update, :delete, to: :crud
  
      can :crud, Group do |g|
        user == g.user
      end
  
      can :crud, GroupPost do |p|
        user == p.user
      end

      can :crud, Comment do |c|
        user == c.user
      end

      can(:destroy, Like) do |like|
        like.user == user
      end
      
    end

  end