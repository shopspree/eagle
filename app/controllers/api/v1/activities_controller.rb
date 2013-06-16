class Api::V1::ActivitiesController < Api::V1::BaseController

  respond_to :json

  # GET /api/v1/activities.json
  def index
    context_id = current_actor.context_id
    @activities = Activity.timeline(context_id)

    respond_with @activities
  end

  # GET /api/v1/activities/1.json
  def show
    @activity = Activity.find(params[:id])

    respond_with @activity
  end
end
