require 'rails_helper'

describe 'Private access to artists', type: :request do
  before do
    user = create(:user)
    sign_in user
  end

  it 'allows access to artists#index' do
    get artists_path

    expect(response).to have_http_status(:success)
  end

  it 'allows access to artists#show' do
    artist = create(:artist)

    get artist_path(artist)

    expect(response).to have_http_status(:success)
  end

  context 'when artist#create' do
    it 'allows access' do
      artist_attributes = attributes_for(:artist)

      post artists_url, params: { artist: artist_attributes }

      expect(response).to redirect_to Artist.last
    end

    it 'creates' do
      artist_attributes = attributes_for(:artist)

      expect {
        post artists_url, params: { artist: artist_attributes }
      }.to change(Artist, :count).by(1)
    end
  end

  context 'when artist#destroy' do
    it 'destroys' do
      artist = create(:artist)

      expect {
        delete artist_url(artist)
      }.to change(Artist, :count).by(-1)
    end

    it 'allows access' do
      artist = create(:artist)

      delete artist_url(artist)

      expect(response).to redirect_to artists_url
    end
  end
end
