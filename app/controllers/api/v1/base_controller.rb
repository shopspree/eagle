class Api::V1::BaseController < ApplicationController

  respond_to :json

  # using devise to authenticate users
  prepend_before_filter :authenticate_user!

  # using cancan to authorize users
  authorize_resource


  protected

  def current_actor
    current_user.actor if current_user
  end

end