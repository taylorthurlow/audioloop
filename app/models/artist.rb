class Artist < ApplicationRecord
  validates :name, presence: true
  validates :image_url, presence: true
  validates :discogs_id, presence: true, uniqueness: true

  def discogs_url
    return "https://www.discogs.com/artist/#{discogs_id}"
  end
end
