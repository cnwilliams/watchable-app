class ListMoviesController < ApplicationController
  def create
    list = List.find(params[:list_id])
    movie = Movie.find(params[:movie_id])

    if list.movies.include?(movie)
      flash[:notice] = movie.title + " is already included in that list."
      redirect_to movie_path(movie)
    else
      list.movies << Movie.find(params[:movie_id])
      list.save
      redirect_to list
    end

  end

  def destroy
    # this ensures that the movie is delted from the list
    list_movie = ListMovie.find_by(list_id: params[:list_id].to_i, movie_id: params[:movie_id].to_i)
    list_movie.destroy
    flash[:notice] = "Movie removed from list"
    redirect_to List.find(params[:list_id].to_i)
  end
end
