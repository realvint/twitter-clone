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
end
