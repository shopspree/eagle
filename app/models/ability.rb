class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    if user.actor
      actor = user.actor

      # Activity
      can :read, Activity, context_id: actor.context_id # can read any activity in the same context

      # Post
      can :create,  Post                      # can create post the actor owns
      can :update,  Post, actor_id: actor.id  # can update post they own
      can :destroy, Post, actor_id: actor.id  # can destroy post they own
      can [:read, :popular], Post do |post|
        can_actor_read_post? actor, post      # can read post of actor in the same context
      end

      # Comment
      can [:create, :read], Comment do |comment|
        can_actor_read_post? actor, comment.post # can create comment on post they can read
      end
      can :update,  Comment, actor_id: actor.id  # can update comment they own
      #can :destroy, Comment, actor_id: actor.id  # can destroy comment they own
      can :destroy, Comment do |comment|
        comment.actor_id == actor.id || comment.post.actor_id == actor.id  # can destroy comment they own or for post they own
      end

      # Like
      can :create,  Like do |like|
        can_actor_read_post? actor, like.post # can create like on post they can read
      end
      can :destroy, Like, actor_id: actor.id  # can destroy like they own

      # Hashtag
      can :create,  Hashtag                               # can create hashtag
      can :read,    Hashtag, context_id: actor.context_id # can read any hashtag in the same context

      # Mention
      can [:create, :read], Mention do |mention|
        can_actor_read_post? actor, mention.post # can create/read mention on post they can read
      end
      can :destroy, Mention, actor_id: actor.id # can destroy mention they own

      # Profile
      can :read,    Profile do |profile|
        profile.actor.context_id == actor.context_id  # can read profile of an actor in the same context
      end
      can :update,  Profile, actor_id: actor.id       # can update profile they own

    end
  end


  protected

  def can_actor_read_post?(actor, post)
    case post.audience_type.name
      when Audience::TYPES[:organization]
        post.actor.context_id == actor.context_id
      when Audience::TYPES[:organization]
        post.actor == actor
      else
        false
    end
  end


end
