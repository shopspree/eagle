class Api::V1::BaseController < ApplicationController

  respond_to :json

  before_filter :authenticate_user!

  def current_actor
    current_user.actor if current_user
  end

end