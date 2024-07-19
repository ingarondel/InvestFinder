class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :destroy]

  def show
    @user = User.find(params[:id])
    @ideas = @user.ideas
  end

  def destroy
    sign_out(current_user)
    redirect_to root_path
  end
end
