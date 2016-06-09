class LoginsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      flash[:success] = "You are logged in"
      redirect_to users_path
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end

end
