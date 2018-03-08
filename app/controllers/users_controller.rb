
class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(user_params)
    if user.save
      
      redirect_to :root
    else
      flash[:error] = "You done goofed"
      render :new
    end
  end



  private
  def user_params
    params.require(user).permit(:email, :password)
  end

end
