
class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )
    if @user
      session[:session_token] = @user.reset_session_token!
      redirect_to user_url(@user)
    else
      flash[:error] = "Invalid login credentials"
      render :new
    end
  end

  def destroy
    session[:session_token] = current_user.reset_session_token!
    current_user.save
    session[:session_token] = nil
    redirect_to new_sessions_url
  end
  private

  def session_params
    p params.require(:user).permit(:email, :password)
  end
end
