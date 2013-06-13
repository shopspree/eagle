class InspectorObserver < ActiveRecord::Observer
  observe :post, :comment, :like

  def before_save(object)
    object.actor_id = current_user.actor.id if object.respond_to? :actor_id
  end


end
