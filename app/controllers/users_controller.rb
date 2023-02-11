class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    redirect_to profile_path if params[:id].to_i == current_user.id

    @user = User.find(params[:id])
  end
end
