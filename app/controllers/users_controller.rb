
class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def show
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome, #{user.name}!"
      # user_path(user.id)
    else
      redirect_to register_path, alert: user.errors.full_messages
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
