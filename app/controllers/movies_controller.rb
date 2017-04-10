class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = if params[:title]
      Movie.where('title LIKE ?', "%#{params[:title].titleize}%")
    else
      Movie.all
    end
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:guidebox_id, :title, :release_date,
    :rating,
    :overview,
    :primary_genre,
    :secondary_genre,
    :tertiary_genre,
    :primary_free_name,
    :primary_free_link,
    :secondary_free_name,
    :secondary_free_link,
    :primary_web_source_name,
    :primary_web_source_link,
    :secondary_web_source_name,
    :secondary_web_source_link,
    :primary_sub_source_name,
    :primary_sub_source_link,
    :secondary_sub_source_name,
    :secondary_sub_source_link,
    :cs_media_link,
    :trailer,
    :sm_img,
    :md_img,
    :lg_img)
      # params.fetch(:movie, {})
    end
end
