class UserObserver < ActiveRecord::Observer

  def after_create(model)
    create_actor
  end

end
