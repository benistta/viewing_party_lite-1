class WelcomeController < ApplicationController
  def index
    # binding.pry
    @users = User.all
    #cookies[:secret_message] = 'hello!!!'
    #cookies.signed[:secret_message] = 'hello!!!'
    #cookies.encrypted[:secret_message] = 'hello!!!'
    # require "pry"; binding.pry .... after deleting session[:user_id] is nil 
  end
end
