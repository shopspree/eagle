class ActivityInspectorObserver < ActiveRecord::Observer
  observe :post, :comment, :like

  def after_create(object)
    if object.respond_to? :activity_object
      # get action id by object type
      action_name = object.class.name
      action = Action.find_or_create_by_name(action_name)
      action_id = action.id

      # get the actor for this object
      actor = object.actor

      # get the organization id for this object actor
      organization_id = object.actor.organization_id

      # create the activity_object for this object
      activity_object = object.create_activity_object

      # create the activity from the above collected attributes
      activity = activity_object.build_activity(action_id: action_id, organization_id: organization_id)
      activity.actors << actor
      activity.save!

    end

  end


end
