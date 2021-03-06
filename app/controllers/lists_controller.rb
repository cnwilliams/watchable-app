class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  def index
    @lists = List.all
  end

  # GET /lists/1
  # GET /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    if valid_list_params?
      if list_params[:movie_id] != nil
        @movie = Movie.find(list_params[:movie_id])
        @movie.lists << @list
      end
      @list = current_user.lists.create(list_params)
      @user = User.find(list_params[:user_id])
      @user.lists << @list

      flash[:notice] = "List successfully created"
      redirect_to @list
    else
      flash[:error] = "List could not be created"
      redirect_to new_list_path
    end

    # respond_to do |format|
    #   if @list.save
    #     format.html { redirect_to @list, notice: 'List was successfully created.' }
    #     format.json { render :show, status: :created, location: @list }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @list.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:title, :genre, :user_id, :movie_id)
    end

# TEST
    def set_movie_for_list
      if @list
        @selected_movie = @list.movie_id
      elsif params[:movie]
        movie_id = params[:movie]
        @movie = Movie.find(movie_id)
        @selected_movie = @movie.id
      else
        @selected_movie = nil
      end
    end

    def valid_list_params?
      List.new(list_params).valid?
    end

end
