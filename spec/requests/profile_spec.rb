require 'rails_helper'

RSpec.describe 'Profile', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET show' do
    it 'succeeds' do
      get profile_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PUT update' do
    it 'updates the profile' do
      expect do
        put profile_path, params: {
          user: {
            bio: 'sample bio'
          }
        }
      end.to change { user.reload.bio }.from(nil).to('sample bio')
      expect(response).to redirect_to(profile_path)
    end
  end
end
