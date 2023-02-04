class TweetPresenter
  include ActionView::Helpers::DateHelper
  include Rails.application.routes.url_helpers

  attr_reader :tweet, :current_user

  def initialize(tweet:, current_user:)
    @tweet = tweet
    @current_user = current_user
  end

  delegate :user, :body, :likes_count, :retweets_count, :views_count, to: :tweet
  delegate :display_name, :username, :avatar, to: :user

  def created_at
    if (Time.zone.now - tweet.created_at) > 1.day
      tweet.created_at.strftime('%b %-d')
    else
      time_ago_in_words(tweet.created_at)
    end
  end

  def avatar
    return user.avatar if user.avatar.present?

    ActionController::Base.helpers.asset_path('avatar.png')
  end

  def like_tweet_url(source: 'tweet_card')
    if tweet_liked_by_current_user?
      tweet_like_path(tweet, current_user.likes.find_by(tweet:), source:)
    else
      tweet_likes_path(tweet, source:)
    end
  end

  def turbo_like_data_method
    if tweet_liked_by_current_user?
      'delete'
    else
      'post'
    end
  end

  def like_heart_img
    if tweet_liked_by_current_user?
      'heart-filled.png'
    else
      'heart-unfilled.png'
    end
  end

  def bookmark_tweet_url(source: 'tweet_card')
    if tweet_bookmarked_by_current_user?
      tweet_bookmark_path(tweet, current_user.bookmarks.find_by(tweet:), source:)
    else
      tweet_bookmarks_path(tweet, source:)
    end
  end

  def turbo_bookmark_data_method
    if tweet_bookmarked_by_current_user?
      'delete'
    else
      'post'
    end
  end

  def bookmark_img
    if tweet_bookmarked_by_current_user?
      'bookmark-blue.png'
    else
      'bookmark-white.png'
    end
  end

  def bookmark_text
    if tweet_bookmarked_by_current_user?
      'Убрать из закладок'
    else
      'Сохранить в закладки'
    end
  end

  def retweet_tweet_url(source: 'tweet_card')
    if tweet_retweeted_by_current_user?
      tweet_retweet_path(tweet, current_user.retweets.find_by(tweet:), source:)
    else
      tweet_retweets_path(tweet, source:)
    end
  end

  def turbo_retweet_data_method
    if tweet_retweeted_by_current_user?
      'delete'
    else
      'post'
    end
  end

  def retweet_img
    if tweet_retweeted_by_current_user?
      'retweet-green.png'
    else
      'retweet-black.png'
    end
  end

  def retweet_text
    if tweet_retweeted_by_current_user?
      'Убрать из перепостов'
    else
      'Перепостить себе'
    end
  end

  private

  def tweet_liked_by_current_user
    @tweet_liked_by_current_user ||= tweet.liked_users.include?(current_user)
  end

  alias tweet_liked_by_current_user? tweet_liked_by_current_user

  def tweet_bookmarked_by_current_user
    @tweet_bookmarked_by_current_user ||= tweet.bookmarked_users.include?(current_user)
  end

  alias tweet_bookmarked_by_current_user? tweet_bookmarked_by_current_user

  def tweet_retweeted_by_current_user
    @tweet_retweeted_by_current_user ||= tweet.retweeted_users.include?(current_user)
  end

  alias tweet_retweeted_by_current_user? tweet_retweeted_by_current_user
end
