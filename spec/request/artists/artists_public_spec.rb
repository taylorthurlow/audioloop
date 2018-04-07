require 'rails_helper'

describe 'Public access to artists', type: :request do
  it 'denies access to artists#index' do
    get artists_path

    expect(response).to redirect_to new_user_session_url
  end

  it 'denies access to artists#show' do
    artist = create(:artist)

    get artist_path(artist)

    expect(response).to redirect_to new_user_session_url
  end

  context 'when artist#create' do
    it 'does not create' do
      artist_attributes = attributes_for(:artist)

      expect {
        post artists_url(artist_attributes)
      }.not_to change(Artist, :count)
    end

    it 'denies access' do
      artist_attributes = attributes_for(:artist)

      post artists_url(artist_attributes)

      expect(response).to redirect_to new_user_session_url
    end
  end

  context 'when artist#destroy' do
    it 'does not destroy' do
      artist = create(:artist)

      expect {
        delete artist_url(artist)
      }.not_to change(Artist, :count)
    end

    it 'denies access' do
      artist = create(:artist)

      delete artist_url(artist)

      expect(response).to redirect_to new_user_session_url
    end
  end
end
