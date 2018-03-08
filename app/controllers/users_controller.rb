
class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save

      redirect_to user_url(@user)
    else
      flash[:error] = "You done goofed"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
