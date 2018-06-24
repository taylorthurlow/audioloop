FactoryBot.define do
  factory :artist do
    name { Faker::Music.band }
    description 'Herbager runed scoffingstock rediscuss bipunctate unicameral underage inspirability.'
    discogs_id { rand(1..100000000) }
    image_url 'http://placehold.it/500x500'
  end
end
