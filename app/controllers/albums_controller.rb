
class AlbumsController < ApplicationController

  def index
    @albums = Album.all
  end

  def new; end

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
    @album = album.find(params[:id])
  end

  def edit
    @album = album.find(params[:id])
  end

  def update
    @album = album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    end
  end

  def destroy
    @album = album.find(params[:id])
    @album.destroy
  end

  private

  def album_params
    params.require(:album).permit(:title, :band_id, :recording_type, :year)
  end

end
