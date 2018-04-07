require 'rails_helper'

describe 'Public access to discogs', type: :request do
  it 'denies access to discogs#search' do
    get discogs_search_path

    expect(response).to redirect_to new_user_session_url
  end
end
