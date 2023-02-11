class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    following = user.followings.create(following_params)
    redirect_to user_path(User.find(following_params[:following_user_id]))
  end

  def destroy
    following = Following.find(params[:id])
    following.destroy
    redirect_to user_path(User.find(following.following_user_id))
  end

  private

  def following_params
    params.permit(:following_user_id)
  end

  def user
    @user ||= User.find(params[:user_id])
  end
end
