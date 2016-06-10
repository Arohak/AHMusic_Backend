class API::V1::ProfilesController < ApplicationController

  def me
    users = User.all
    render json: users
  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { data: {status: "success"} }
    else
      render json: { data: {status: "faild"} }
    end
  end

  def signup
    @user = User.new(name: params[:name],
                     email: params[:email],
                     password:  params[:password],
                     password_confirmation:  params[:password_confirmation])
    if @user.save
      render json: { data: {status: "success"} }
    else
      render json: { data: {status: "faild"} }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

