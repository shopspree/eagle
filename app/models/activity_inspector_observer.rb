class ActivityInspectorObserver < ActiveRecord::Observer
  observe :post, :comment, :like

  def after_create(object)
    if object.respond_to? :activity
      # get action id by object type
      action_sym = object.class.name.to_sym
      action = Action.find_or_create_by_name(action_sym)
      action_id = action.id

      # get the actor for this object
      actor = object.actor

      # get the organization id for this object actor
      context_id = object.actor.context_id

      # create the activity from the above collected attributes
      activity = object.build_activity(action_id: action_id, context_id: context_id)
      activity.actors << actor
      activity.save!

    end

  end


end
