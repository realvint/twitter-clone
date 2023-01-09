class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end
end
