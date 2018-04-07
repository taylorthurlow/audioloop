require 'rails_helper'

describe Artist, type: :model do
  subject(:artist) { build(:artist) }

  it 'has a valid factory' do
    expect(artist).to be_valid
  end

  context 'when name is nil' do
    it 'is not valid' do
      artist.name = nil

      expect(artist).not_to be_valid
    end
  end

  context 'when discogs id is nil' do
    it 'is not valid' do
      artist.discogs_id = nil

      expect(artist).not_to be_valid
    end
  end

  context 'when discogs id is not unique' do
    it 'is not valid' do
      create(:artist)
      other_artist = build(:artist, discogs_id: artist.discogs_id)

      expect(other_artist).not_to be_valid
    end
  end

  context 'when image url is nil' do
    it 'is not valid' do
      artist.image_url = nil

      expect(artist).not_to be_valid
    end
  end

  describe Artist, '#discogs_url', type: :model do
    it 'returns the discogs url' do
      artist = create(:artist, discogs_id: 4321)

      expect(artist.discogs_url).to eq 'https://www.discogs.com/artist/4321'
    end
  end
end
