class Subscription < ApplicationRecord
  validates :user_id, presence: true
  validates :artist_id, presence: true
  validates :artist_id, uniqueness: { scope: [:user_id, :artist_id] }

  belongs_to :user
  belongs_to :artist
end
