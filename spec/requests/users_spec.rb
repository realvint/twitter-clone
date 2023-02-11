require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'GET show' do
    it 'succeeds' do
      get user_path(user)
      expect(response).to have_http_status(:redirect)
    end
  end
end
