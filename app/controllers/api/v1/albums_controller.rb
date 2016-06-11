class API::V1::AlbumsController < ApplicationController

  GET_ALBUM                = "album/"

  def show
    json = RestClient.get $ROOT_URL + GET_ALBUM + params[:id]
    response = JSON.parse(json)
    render json: response
  end

end