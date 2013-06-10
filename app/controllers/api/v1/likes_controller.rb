class LikesController < ApplicationController

  respond_to :json
  
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

    if @like.save
        respond_with @like, status: :created, location: @like
    else
        respond_with @like.errors, status: :unprocessable_entity
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
        respond_with head :no_content
    else
        respond_with @like.errors, status: :unprocessable_entity
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

    respond_with head :no_content
  end
end
