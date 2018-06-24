class Artist < ApplicationRecord
  validates :name, presence: true
  validates :image_url, presence: true
  validates :discogs_id, presence: true, uniqueness: true

  has_many :subscriptions
  has_many :artists, through: :subscriptions, as: :subscribers

  def discogs_url
    return "https://www.discogs.com/artist/#{discogs_id}"
  end
end
