class Api::V1::ActivitiesController < Api::V1::BaseController

  respond_to :json

  # GET /api/v1/activities.json
  def index
    context_id = current_actor.context_id
    page = params[:activity] ? params[:activity][:page] : 1
    @activities = Activity.timeline(context_id).page(page)

    #user_likes = Like.user_likes current_actor
    #@liked_objects = Hash.new
    #user_likes.each do |like|
    #  @liked_objects[like.likeable] = true
    #end

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
