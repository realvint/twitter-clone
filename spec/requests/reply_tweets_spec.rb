require 'rails_helper'

RSpec.describe 'ReplyTweets', type: :request do
  describe 'POST create' do
    it 'creates a new tweet' do
      user = create(:user)
      parent_tweet = create(:tweet)
      sign_in user
      expect do
        post tweet_reply_tweets_path(parent_tweet), params: {
          tweet: {
            body: 'New tweet body'
          }
        }
      end.to change { Tweet.count }.by(1)

      expect(response).to redirect_to(dashboard_path)
    end
  end
end
