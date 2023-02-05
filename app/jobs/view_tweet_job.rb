class ViewTweetJob < ApplicationJob
  queue_as :default

  def perform(tweet:, user:)
    View.create(tweet: tweet, user: user) unless tweet_viewed?(tweet: tweet, user: user)
  end

  private

  def tweet_viewed?(tweet:, user:)
    View.exists?(user: user, tweet: tweet)
  end
end
