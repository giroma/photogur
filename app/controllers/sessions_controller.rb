class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      p session[:user_id] = @user.id
      redirect_to root_url, notice: "Logged in!"
    else
      render :new
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
