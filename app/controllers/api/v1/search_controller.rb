class API::V1::SearchController < ApplicationController

  SEARCH                   = "search?q="
  SEARCH_ALBUM             = "search/album?q="
  SEARCH_ARTIST            = "search/artist?q="
  SEARCH_PLAYLIST          = "search/playlist?q="
  SEARCH_TRACK             = "search/track?q="

  def all
    json = RestClient.get $ROOT_URL + SEARCH + params[:q]
    response = JSON.parse(json)
    render json: response
  end

  def album
    json = RestClient.get $ROOT_URL + SEARCH_ALBUM + params[:q]
    response = JSON.parse(json)
    render json: response
  end

  def artist
    json = RestClient.get $ROOT_URL + SEARCH_ARTIST + params[:q]
    response = JSON.parse(json)
    render json: response
  end

  def playlist
    json = RestClient.get $ROOT_URL + SEARCH_PLAYLIST + params[:q]
    response = JSON.parse(json)
    render json: response
  end

  def track
    json = RestClient.get $ROOT_URL + SEARCH_TRACK + params[:q]
    response = JSON.parse(json)
    render json: response
  end

end