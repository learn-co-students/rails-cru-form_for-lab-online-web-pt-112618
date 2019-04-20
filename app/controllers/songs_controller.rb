class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(set_params(:name, :artist_id, :genre_id))
    @song.save
    redirect_to song_path(@song)
  end

  def show
    find_by_id
  end

  def edit
    find_by_id
  end

  def update
    find_by_id
    @song = Song.update(set_params(:name, :artist_id, :genre_id))
    redirect_to song_path(@song)
  end

  private
  def find_by_id
    @song = Song.find_by(params[:id])
  end

  def set_params(*args)
    params.require(:song).permit(*args)
  end
end
