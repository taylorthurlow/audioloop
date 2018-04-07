require 'rails_helper'

describe User, type: :model do
  subject(:user) { build(:user) }

  it 'has a valid factory' do
    expect(user).to be_valid
  end
end
