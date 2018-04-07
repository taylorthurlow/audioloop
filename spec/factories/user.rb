FactoryBot.define do
  factory :user do
    email 'bob@example.com'
    password 'secret'
    password_confirmation 'secret'
  end
end
