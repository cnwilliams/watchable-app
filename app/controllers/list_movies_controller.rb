class ListMoviesController < ApplicationController
  def create
    list = List.find(params[:list_id])
    list.movies << Movie.find(params[:movie_id])
    list.save
    redirect_to list
  end
end
