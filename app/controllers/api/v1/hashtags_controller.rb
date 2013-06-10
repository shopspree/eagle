class HashtagsController < ApplicationController

  respond_to :json

  # GET /api/v1/hashtags.json
  def index
    @hashtags = Hashtag.all

    respond_with @hashtags
  end

  # GET /api/v1/hashtags/1.json
  def show
    @hashtag = Hashtag.find(params[:id])

    respond_with @hashtag
  end

  # POST /api/v1/hashtags.json
  def create
    @hashtag = Hashtag.new(params[:hashtag])

    if @hashtag.save
      respond_with @hashtag, status: :created, location: @hashtag
    else
      respond_with @hashtag.errors, status: :unprocessable_entity
    end
  end

  # GET /api/v1/hashtags/popular.json
  def popular
    @hashtags = Hashtag.popular

    respond_with @hashtags
  end

  # GET /api/v1/hashtags/suggest/ab.json
  def suggest
    @hashtags = Hashtag.suggest(params[:prefix])

    respond_with @hashtags
  end
end

