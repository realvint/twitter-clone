class TweetPresenter
  include ActionView::Helpers::DateHelper

  attr_reader :tweet

  def initialize(tweet)
    @tweet = tweet
  end

  delegate :user, :body, to: :tweet
  delegate :display_name, :username, :avatar, to: :user

  def created_at
    if (Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime('%b %-d')
    else
      time_ago_in_words(tweet.created_at)
    end
  end
end
