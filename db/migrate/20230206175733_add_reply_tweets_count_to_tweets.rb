class AddReplyTweetsCountToTweets < ActiveRecord::Migration[7.0]
  def change
    add_column :tweets, :reply_tweets_count, :integer, null: false, default: 0
  end
end
