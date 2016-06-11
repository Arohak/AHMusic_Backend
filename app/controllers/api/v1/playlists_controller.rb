class API::V1::PlaylistsController < ApplicationController

 GET_PLAYLIST             = "playlist/"

  def show
    json = RestClient.get $ROOT_URL + GET_PLAYLIST + params[:id]
    response = JSON.parse(json)
    render json: response
  end

end