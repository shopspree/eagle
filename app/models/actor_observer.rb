class ActorObserver < ActiveRecord::Observer

  def before_create(actor)
    email = actor.user.email
    actor.create_profile(email: email) unless actor.profile
    actor.create_job_profile(email: email) unless actor.job_profile
  end

end
