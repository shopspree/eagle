class Api::V1::LikesController < Api::V1::BaseController

  # GET /api/v1/posts/1/likes.json
  # GET /api/v1/comments/1/likes.json
  def index
    @likes = if params[:post_id]
               Post.find(params[:post_id]).likes.all
             else
               Comment.find(params[:comment_id]).likes.all
             end

    respond_with @likes
  end

  # GET /api/v1/posts/1/likes/1.json
  # GET /api/v1/comments/1/likes/1.json
  def show
    @like = if params[:post_id]
              Post.find(params[:post_id]).likes.find(params[:id])
            else
              Comment.find(params[:comment_id]).likes.find(params[:id])
            end

    respond_with @like
  end

  # POST /api/v1/posts/1/likes.json
  # POST /api/v1/comments/1/likes.json
  def create
    @like = if params[:post_id]
              Post.find(params[:post_id]).likes.new(params[:like])
            else
              Comment.find(params[:comment_id]).new(params[:like])
            end
    @like.actor_id = current_actor.id

    if @like.save
        respond_with @like, status: :created, location: nil
    else
        respond_with @like.errors, status: :unprocessable_entity, location: nil
    end
  end

  # PUT /api/v1/posts/1/likes/1.json
  # PUT /api/v1/comments/1/likes/1.json
  def update
    @like = if params[:post_id]
              Post.find(params[:post_id]).likes.find(params[:id])
            else
              Comment.find(params[:comment_id]).likes.find(params[:id])
            end

    if @like.update_attributes(params[:like])
        respond_with { head :no_content }
    else
        respond_with { render json: @like.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /api/v1/posts/1/likes/1.json
  # DELETE /api/v1/comments/1/likes/1.json
  def destroy
    @like = if params[:post_id]
              Post.find(params[:post_id]).likes.find(params[:id])
            else
              Comment.find(params[:comment_id]).likes.find(params[:id])
            end
    @like.destroy

    render { head :no_content, status: :no_content, location: nil }
  end
end
