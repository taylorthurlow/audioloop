require 'test_helper'

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in users(:user_one)
    @artist = artists(:artist_one)
  end

  test 'should get index' do
    get artists_url
    assert_response :success
  end

  test 'should show artist' do
    get artist_url(@artist)
    assert_response :success
  end

  test 'should create artist' do
    assert_difference('Artist.count') do
      post artists_url, params: {
        artist: {
          description: 'some description',
          discogs_id: 567,
          image_url: 'http://placehold.it/500x500',
          name: 'lesbian wednesdays'
        }
      }
    end

    assert_redirected_to artist_url(Artist.last)
  end

  test 'should destroy artist' do
    assert_difference('Artist.count', -1) do
      delete artist_url(@artist)
    end

    assert_redirected_to artists_url
  end
end
