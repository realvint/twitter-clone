class TweetsController < ApplicationController
  def create
    tweet = Tweet.new(tweet_params.merge(user: current_user))

    return unless tweet.save

    redirect_to root_path

  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
