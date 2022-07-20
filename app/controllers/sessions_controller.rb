class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "Welcome, #{user.email}"
      redirect_to root_path
    else
      flash[:error] = "Invalid Credentials"
      render :new
    end
  end

  def destroy
    # session[:user_id] = nil
     session.delete
     redirect_to root_path
  end
end
