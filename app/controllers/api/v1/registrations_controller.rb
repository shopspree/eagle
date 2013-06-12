class Api::V1::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  # POST /api/v1/registrations.json
  def create
    user = User.new(params[:user])

    if user.valid? && user.save
      render json: {user: user.as_json, auth_token: user.authentication_token}, status: 201
      return
    else
      warden.custom_failure!
      render json: {errors: user.errors}, status: 422
    end
  end

end
