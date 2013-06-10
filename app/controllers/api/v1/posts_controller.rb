class PostsController < ApplicationController
  before_filter temp_actor

  respond_to :json

  # GET /api/v1/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  # POST /api/v1/posts.json
  def create
    @post = @actor.posts.new(params[:post])

    if @post.save
      respond_with @post, status: :created, location: @post
    else
      respond_with @post.errors, status: :unprocessable_entity
    end

  end

  # PUT /api/v1/posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      respond_with head :no_content
    else
      respond_with @post.errors, status: :unprocessable_entity
    end

  end

  # DELETE /api/v1/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_with head :no_content
  end

  # GET /api/v1/posts/popular.json
  def popular
    @posts = Post.popular

    respond_with @posts
  end

  # GET /api/v1/posts/posts_by_user_id/:user_id.json
  def posts_by_user_id
    @posts = Post.posts_by_user_id(params[:user_id])

    responds_with @posts

  end

  private
  def temp_actor
    @actor = Actor.find_or_create_by_id(1)
  end
end
