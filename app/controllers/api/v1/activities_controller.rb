class Api::V1::ActivitiesController < ApplicationController
  # GET /api/v1/activities
  # GET /api/v1/activities.json
  def index
    @api_v1_activities = Api::V1::Activity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_v1_activities }
    end
  end

  # GET /api/v1/activities/1
  # GET /api/v1/activities/1.json
  def show
    @api_v1_activity = Api::V1::Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_v1_activity }
    end
  end

  # GET /api/v1/activities/new
  # GET /api/v1/activities/new.json
  def new
    @api_v1_activity = Api::V1::Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_v1_activity }
    end
  end

  # GET /api/v1/activities/1/edit
  def edit
    @api_v1_activity = Api::V1::Activity.find(params[:id])
  end

  # POST /api/v1/activities
  # POST /api/v1/activities.json
  def create
    @api_v1_activity = Api::V1::Activity.new(params[:api_v1_activity])

    respond_to do |format|
      if @api_v1_activity.save
        format.html { redirect_to @api_v1_activity, notice: 'Activity was successfully created.' }
        format.json { render json: @api_v1_activity, status: :created, location: @api_v1_activity }
      else
        format.html { render action: "new" }
        format.json { render json: @api_v1_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/v1/activities/1
  # PUT /api/v1/activities/1.json
  def update
    @api_v1_activity = Api::V1::Activity.find(params[:id])

    respond_to do |format|
      if @api_v1_activity.update_attributes(params[:api_v1_activity])
        format.html { redirect_to @api_v1_activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_v1_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/activities/1
  # DELETE /api/v1/activities/1.json
  def destroy
    @api_v1_activity = Api::V1::Activity.find(params[:id])
    @api_v1_activity.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_activities_url }
      format.json { head :no_content }
    end
  end
end
