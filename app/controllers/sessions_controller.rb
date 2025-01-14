class SessionsController < ApplicationController

  def create
    @user = User.find_by_username(params[:username])
    if @user 
      session[:user_id] = @user.id
      render json: @user
    else
      render json: { error: "User doesn't exist" }, status: :not_found
    end
  end

  def destroy
    session.delete :user_id
    head :no_content
  end

end
