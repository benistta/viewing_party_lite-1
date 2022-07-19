
class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      redirect_to user_path(new_user.id), notice: "Welcome, #{new_user.name}!"
    else
      redirect_to register_path, alert: new_user.errors.full_messages
   end
  end

  def discover
    @user = User.find(params[:user_id])
  end

  def login
  end

  def login_user
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      redirect_to user_path(user.id)
      flash[:success] = "Welcome back, #{user.email}"
    else
      flash[:error] = 'Invalid Credentials'
      render :login
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
