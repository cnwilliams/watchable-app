class ListMoviesController < ApplicationController
  def create
    list = List.find(params[:list_id])

    if list.movies.include?(Movie.find(params[:movie_id]))
      flash[:notice] = "You already have that movie in your list, silly :p"
    else
      list.movies << Movie.find(params[:movie_id])
      list.save
    end
    redirect_to list
  end

  def destroy
    # this ensures that the movie is delted from the list
    list_movie = ListMovie.find_by(list_id: params[:list_id].to_i, movie_id: params[:movie_id].to_i)
    list_movie.destroy
    flash[:notice] = "Movie removed from list"
    redirect_to List.find(params[:list_id].to_i)
  end
end
