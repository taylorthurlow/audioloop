FactoryBot.define do
  factory :subscription do
    user { User.first || association(:user) }
    artist { Artist.first || association(:artist) }
  end
end
