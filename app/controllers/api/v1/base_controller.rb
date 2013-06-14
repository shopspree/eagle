class Api::V1::BaseController < ApplicationController

  respond_to :json

  prepend_before_filter :authenticate_user!

  #before_filter :set_actor_id_to_current

  def current_actor
    current_user.actor if current_user
  end

end