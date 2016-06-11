class API::V1::ArtistsController < ApplicationController

  GET_ARTIST               = "artist/"

  def show
    json = RestClient.get $ROOT_URL + GET_ARTIST + params[:id]
    response = JSON.parse(json)
    render json: response
  end

end