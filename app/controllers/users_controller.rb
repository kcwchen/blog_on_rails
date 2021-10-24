class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Signed Up"
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      render :edit
    else
      render :edit
    end
  end

  private

  def user_params
    user_params = params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )

    # Remove the password and password confirmation keys for empty values
    #user_params.delete(:password) unless user_params[:password].present?
    #user_params.delete(:password_confirmation) unless user_params[:password_confirmation].present?

    user_params
  end
end
