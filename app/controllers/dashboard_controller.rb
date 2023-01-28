class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.includes(:user).order(created_at: :desc).map { |tweet| TweetPresenter.new(tweet) }
  end
end
