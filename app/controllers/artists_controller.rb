class ArtistsController < ApplicationController

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(set_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  def show
    find_by_id
  end

  def edit
    find_by_id
  end

  def update
    find_by_id
    @artist = Artist.update(set_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private
  def find_by_id
    @artist = Artist.find_by(params[:id])
  end

  def set_params(*args)
    params.require(:artist).permit(*args)
  end
end
