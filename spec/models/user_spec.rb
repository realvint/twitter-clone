require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:tweets).dependent(:destroy) }
  it { should validate_uniqueness_of(:username).case_insensitive.allow_blank }

  describe '#set_display_name' do
    context 'when display_name is set' do
      it 'does not change the display_name' do
        user = build(:user, username: 'bob', display_name: 'bobby')
        user.save
        expect(user.reload.display_name).to eq('bobby')
      end
    end

    context 'when display name is not set' do
      it 'humanizes the previously set username' do
        user = build(:user, username: 'bob', display_name: nil)
        user.save
        expect(user.reload.display_name).to eq('Bob')
      end
    end
  end
end
