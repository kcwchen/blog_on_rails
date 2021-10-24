class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed In"
    else
      flash.now[:alert] = "Wrong Email or Password"
      render :new
    end
  end
end
