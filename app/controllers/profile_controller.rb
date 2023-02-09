class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def update
    current_user.update(user_params[:password].blank? ? user_params.except(:password) : user_params)
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :display_name, :email, :password, :bio, :location, :url)
  end
end
