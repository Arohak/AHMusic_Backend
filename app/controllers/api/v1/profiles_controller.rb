class API::V1::ProfilesController < ApplicationController
  def me
    users = User.all
    render json: users
  end
end
