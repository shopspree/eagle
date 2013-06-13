class Api::V1::ProfilesController < Api::V1::BaseController

  # GET /api/v1/users/john.doe@email.com/profiles.json
  def show
    @profile = profile_by_username(params[:username])

    respond_with { render json: @profile }
  end

  # PUT /api/v1/users/john.doe@email.com/profiles.json
  def update
    @profile = profile_by_username(params[:username])

    if @profile.update_attributes(params[:profile])
      respond_with { head :no_content }
    else
      respond_with { render json: @profile.errors, status: :unprocessable_entity }
    end
  end

  protected

  def profile_by_username(username)
    user = if current_user && current_user.email  == usernmane
             current_user
           else
             User.find_by_email(username)
           end

    @profile = user.actor.profile if user
  end
end
