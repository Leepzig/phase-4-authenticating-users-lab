class UsersController < ApplicationController

  def show
    @user = User.find_by_id(session[:user_id])
    if @user
      render json: @user
    else
      render json: {error: "not authorized"}, status: :unauthorized
    end
  end

  def delete
    session.delete :user_id
    head :no_content
  end


end
