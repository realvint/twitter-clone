require 'rails_helper'

RSpec.describe ViewTweetJob, type: :job do
  let(:user) { create(:user) }
  let(:tweet) { create(:tweet) }

  subject do
    described_class.new.perform(tweet: tweet, user: user)
  end

  it 'creates a view record when tweet has not been viewed' do
    expect { subject }.to change { View.count }.by(1)
  end

  it 'does not create a view record when tweet has already been viewed' do
    create(:view, user: user, tweet: tweet)

    expect { subject }.not_to change { View.count }
  end
end
