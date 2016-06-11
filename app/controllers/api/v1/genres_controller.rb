class API::V1::GenresController < ApplicationController

  GET_GENRE                = "genre"

  def index
    json = RestClient.get $ROOT_URL + GET_GENRE
    response = JSON.parse(json)
    render json: response
  end

  def genre
    json = RestClient.get $ROOT_URL + GET_GENRE
    response = JSON.parse(json)
    render json: response
  end

end
