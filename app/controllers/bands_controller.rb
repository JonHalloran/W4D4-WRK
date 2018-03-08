
class BandsController < ApplicationController

  def index; end

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

  def edit; end

  def update
    @band = Band.find(param[:id])
    @band.update(band_params)
  end

  def show; end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
