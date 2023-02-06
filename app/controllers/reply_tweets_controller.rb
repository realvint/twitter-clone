class ReplyTweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = tweet.reply_tweets.create(tweet_params.merge(user: current_user))

    return unless @tweet.save

    respond_to do |format|
      format.html { redirect_to dashboard_path }
      format.turbo_stream
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body)
  end

  def tweet
    @tweet ||= Tweet.find(params[:tweet_id])
  end
end
