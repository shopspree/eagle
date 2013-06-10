class Api::V1::CommentsController < ApplicationController

  respond_to :json

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

    if @comment.save
      respond_with @comment, status: :created, location: @comment
    else
      respond_with @comment.errors, status: :unprocessable_entity
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

    respond_with head :no_content 
  end
end
