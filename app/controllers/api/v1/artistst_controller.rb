class API::V1::ArtiststController < ApplicationController

  GET_ARTIST_TRACKS        = "artist/"

  def tracks
    json = RestClient.get $ROOT_URL + GET_ARTIST_TRACKS + params[:id] + "/top?limit=" + params[:limit]
    response = JSON.parse(json)
    render json: response
  end
end