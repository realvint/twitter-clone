require 'rails_helper'

RSpec.describe Like, type: :model do
  it { should belong_to :user }
  it { should belong_to :tweet }
  # it { should validate_uniqueness_of(:user_id).scoped_to(:tweet_id) }
end
