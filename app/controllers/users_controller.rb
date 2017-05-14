class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:notice] = 'Registration successful'
      redirect_to root_path, status: 302
    else
      render :new, status: 422
    end
  end

  def show
    @user = User.find(session[:id])
  end

  def edit
    @user = User.find(session[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:notice] = "Update successful"
      redirect_to @user, status: 302
    else
      render 'edit'
    end
  end

  def destroy
    User.find(session[:id]).destroy
    logout
    flash[:notice] = "Account removed"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :phone_number)
  end
end
