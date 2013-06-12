class Api::V1::ProfilesController < ApplicationController
  # GET /api/v1/profiles
  # GET /api/v1/profiles.json
  def index
    @api_v1_profiles = Api::V1::Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_v1_profiles }
    end
  end

  # GET /api/v1/profiles/1
  # GET /api/v1/profiles/1.json
  def show
    @api_v1_profile = Api::V1::Profile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_v1_profile }
    end
  end

  # GET /api/v1/profiles/new
  # GET /api/v1/profiles/new.json
  def new
    @api_v1_profile = Api::V1::Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_v1_profile }
    end
  end

  # GET /api/v1/profiles/1/edit
  def edit
    @api_v1_profile = Api::V1::Profile.find(params[:id])
  end

  # POST /api/v1/profiles
  # POST /api/v1/profiles.json
  def create
    @api_v1_profile = Api::V1::Profile.new(params[:api_v1_profile])

    respond_to do |format|
      if @api_v1_profile.save
        format.html { redirect_to @api_v1_profile, notice: 'Profile was successfully created.' }
        format.json { render json: @api_v1_profile, status: :created, location: @api_v1_profile }
      else
        format.html { render action: "new" }
        format.json { render json: @api_v1_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/v1/profiles/1
  # PUT /api/v1/profiles/1.json
  def update
    @api_v1_profile = Api::V1::Profile.find(params[:id])

    respond_to do |format|
      if @api_v1_profile.update_attributes(params[:api_v1_profile])
        format.html { redirect_to @api_v1_profile, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_v1_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/profiles/1
  # DELETE /api/v1/profiles/1.json
  def destroy
    @api_v1_profile = Api::V1::Profile.find(params[:id])
    @api_v1_profile.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_profiles_url }
      format.json { head :no_content }
    end
  end
end
