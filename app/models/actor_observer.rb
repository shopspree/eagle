class ActorObserver < ActiveRecord::Observer

  def after_create(model)
    create_profile()
  end

end
