class Retweet < ApplicationRecord
  belongs_to :user
  belongs_to :tweet, counter_cache: :retweets_count

  validates :user_id, uniqueness: { scope: :tweet_id }
end
