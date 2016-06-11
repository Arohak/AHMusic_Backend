class API::V1::TracksController < ApplicationController

  GET_TRACK                = "track/"

  def show
    json = RestClient.get $ROOT_URL + GET_TRACK + params[:id]
    response = JSON.parse(json)
    render json: response
  end

end