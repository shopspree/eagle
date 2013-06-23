class ActorObserver < ActiveRecord::Observer

  def before_create(actor)
    actor.create_profile(email: actor.user.email) unless actor.profile
  end

end
