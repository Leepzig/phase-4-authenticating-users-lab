class UsersController < ApplicationController

  def show
    @user = User.find_by_id(session[:user_id])
    if @user
      render json: @user
    else
      render json: {error: "user not found"}, status: :not_found
    end
  end


end
