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
      flash.now[:notice] = "Account Updated"
      render :edit
    else
      render :edit
    end
  end

  def edit_password
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user&.authenticate(params[:current_password])
      current_password = params[:current_password]
      new_password = params[:new_password]
      new_password_confirmation = params[:new_password_confirmation]
      if new_password != new_password_confirmation
        flash[:alert] = "New password does not match new password confirmation"
        render :edit_password
      elsif new_password == current_password
        flash[:alert] = "New password is the same as current password"
        render :edit_password
      else
        if @user.update(password: new_password, password_confirmation: new_password_confirmation)
          flash[:notice] = "Password Updated"
          render :edit
        else
          flash[:alert] = "Password could not be updated"
          render :edit_password
        end
      end
    else
      flash[:alert] = "Current password is incorrect"
      render :edit_password
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
