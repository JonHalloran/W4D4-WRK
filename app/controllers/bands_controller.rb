
class BandsController < ApplicationController

  def index
    @bands = Band.all
  end

  def new; end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash[:error] = "Band not created successfully, please try again"
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    redirect_to band_url(@band)
  end

  def show
    @band = Band.find(params[:id])
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
