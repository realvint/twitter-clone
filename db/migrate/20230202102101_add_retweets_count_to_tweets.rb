class AddRetweetsCountToTweets < ActiveRecord::Migration[7.0]
  def up
    add_column :tweets, :retweets_count, :integer, null: false, default: 0

    Tweet.find_each do |tweet|
      tweet.update! retweets_count: tweet.retweets.size
    end
  end

  def down
    remove_column :tweets, :retweets_count
  end
end
