class Api::V1::CommentsController < Api::V1::BaseController

  # GET /api/v1/posts/1/comments.json
  def index
    @comments = Post.find(params[:post_id]).comments.all

    respond_with @comments   
  end

  # GET /api/v1/posts/1/comments/1.json
  def show
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    respond_with @comment    
  end

  # POST /api/v1/posts/1/comments.json
  def create
    @comment = Post.find(params[:post_id]).comments.new(params[:comment])
    @comment.actor_id = current_actor.id

    if @comment.save
      respond_with @comment, status: :created, location: nil
    else
      respond_with @comment.errors, status: :unprocessable_entity, location: nil
    end
  end

  # PUT /api/v1/posts/1/comments/1.json
  def update
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      respond_with head :no_content
    else
      respond_with @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1/comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    render json: {success: true, message: "successfully destroyed comment #{params[:id]}"}.to_json, status: :no_content, location: nil
  end
end
