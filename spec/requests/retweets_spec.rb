require 'rails_helper'

RSpec.describe 'Retweets', type: :request do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }

  before { sign_in user }

  describe 'POST create' do
    it 'creates a new retweet' do
      expect do
        post tweet_retweets_path(tweet)
      end.to change { Retweet.count }.by(1)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a retweet' do
      retweet = create(:retweet, user: user, tweet: tweet)
      expect do
        delete tweet_retweet_path(tweet, retweet)
      end.to change { Retweet.count }.by(-1)
      expect(response).to have_http_status(:redirect)
    end
  end

end
