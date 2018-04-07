require 'rails_helper'

describe 'Private access to discogs', type: :request do
  def stub_discogs_api
    stub_request(:get, %r{api.discogs.com/database/search}).
      to_return(status: 200, body: "", headers: {})
  end

  before do
    user = create(:user)
    sign_in user
    stub_discogs_api
  end

  context 'when discogs#search' do
    it 'allows access' do
      stub_discogs_api

      get discogs_search_path

      expect(response).to have_http_status(:success)
    end
  end
end
