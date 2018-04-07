require 'test_helper'

class DiscogsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
  end

  test 'should get search' do
    get discogs_search_url
    assert_response :success
  end
end
