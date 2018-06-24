require 'rails_helper'

describe Subscription, type: :model do
  subject(:subscription) { build(:subscription) }

  it 'has a valid factory' do
    expect(subscription).to be_valid
  end

  context 'when user_id is blank' do
    it 'is not valid' do
      subscription.user_id = nil

      expect(subscription).not_to be_valid
    end
  end

  context 'when artist_id is blank' do
    it 'is not valid' do
      subscription.artist_id = nil

      expect(subscription).not_to be_valid
    end
  end

  context 'when user artist pair is not unique' do
    it 'is not valid' do
      subscription = create(:subscription)
      duplicate_subscription = build(:subscription, user: subscription.user, artist: subscription.artist)

      expect(duplicate_subscription).not_to be_valid
    end
  end
end
