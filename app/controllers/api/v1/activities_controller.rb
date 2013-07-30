class Api::V1::ActivitiesController < Api::V1::BaseController

  respond_to :json

  # GET /api/v1/activities.json
  # GET /api/v1/post/:post_id/activities.json
  def index
    @activities =  if params[:post_id]
                     [Post.find(params[:post_id]).activity]
                   else
                     context_id = current_actor.context_id
                     page = params[:activity] ? params[:activity][:page] : 1
                     Activity.timeline(context_id).page(page)
                   end

  end


  # GET /api/v1/activities/1.json
  def show
    @activity = Activity.find(params[:id])
  end


  protected

  def newfeed(activities)
    if activity.timelineable_type == 'Post'
      activity.to_json(
          only: [:id,:timelineable_type, :created_at],
          include: [ timelineable: {
              only: [:id, :content, :likes_count, :comment_count],
              include: [ :medias, actor: {
                  only: [],
                  include: [ profile: {
                      only: [:email, :first_name, :last_name]
                  }]
              }]
          }]
      )
    elsif activity.timelineable_type == 'Like'
    elsif activity.timelineable_type == 'Comment'
    end
  end
end
