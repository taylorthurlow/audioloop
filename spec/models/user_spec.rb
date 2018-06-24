require 'rails_helper'

describe User, type: :model do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end

  context 'when a user is destroyed' do
    it 'the subscriptions are also destroyed' do
      user = create(:user)
      subscription = create(:subscription, user: user)

      expect { user.destroy }.to change { Subscription.count }.by(-1)
    end
  end
end
