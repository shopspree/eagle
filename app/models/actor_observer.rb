class ActorObserver < ActiveRecord::Observer

  def after_create(actor)
    actor.create_profile(email: actor.user.email, context_id: actor.context_id) unless actor.profile
  end

end
