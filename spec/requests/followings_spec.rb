require 'rails_helper'

RSpec.describe 'Followings', type: :request do
  let(:first_user) { create(:user) }
  let(:second_user) { create(:user) }

  before { sign_in first_user }

  describe 'POST create' do
    it 'create a new following' do
      expect do
        post user_followings_path(first_user), params: {
          following_user_id: second_user.id
        }
      end.to change { Following.count }.by(1)
      expect(response).to redirect_to user_path(second_user)
    end
  end

  describe 'DELETE destroy' do
    it 'deletes an existing following' do
      following = create(:following, user: first_user, following_user: second_user)
      expect do
        delete user_following_path(first_user, following)
      end.to change { Following.count }.by(-1)
      expect(response).to redirect_to user_path(second_user)
    end
  end
end
