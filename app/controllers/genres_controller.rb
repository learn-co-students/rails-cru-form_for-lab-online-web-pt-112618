class GenresController < ApplicationController

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(set_params)
    @genre.save
    redirect_to genre_path(@genre)
  end

  def show
    find_by_id
  end

  def edit
    find_by_id
  end

  def update
    find_by_id
    @genre = Genre.update(set_params)
    redirect_to genre_path(@genre)
  end

  private
  def find_by_id
    @genre = Genre.find_by(params[:id])
  end

  def set_params
    params.require(:genre).permit(:name)
  end
end
