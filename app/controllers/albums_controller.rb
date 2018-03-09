
class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:error] = "Album creation aborted"
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :recording_type, :year)
  end

end
