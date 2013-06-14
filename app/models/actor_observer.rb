class ActorObserver < ActiveRecord::Observer

  def after_create(actor)
    actor.create_profile(email: actor.user.email,
                         organization_id: actor.organization_id) unless actor.profile
  end

end
