class Api::V1::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, only: [:create ]

  before_filter :ensure_params_exist

  def create
    build_resource
    resource = User.find_for_database_authentication(email: params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.nil?
      render json: {success: false, message: "Error with your login or password"}, status: 401
    end

    if resource.valid_password?(params[:user_login][:password])
      sign_in(:user, resource)
      render json: {success: true, auth_token: resource.authentication_token, email: resource.email}, status: :ok
    else
      render json: {success: false, message: "Error with your login or password"}, status: 401
    end
  end

  def destroy
    resource = User.find_by_authentication_token(params[:auth_token]||request.headers["X-AUTH-TOKEN"])
    resource.authentication_token = nil
    resource.save
    sign_out(resource_name)
    render json: {}.to_json, status: :ok
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render json:{success: false, message: "missing user_login parameter"}, status: 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {success: false, message: "Error with your login or password"}, status: 401
  end

  def verified_request?
    request.content_type == "application/json" || super
  end

end