class DiscogsController < ApplicationController
  before_action :authenticate_user!

  respond_to :html

  def search
    discogs = Discogs::Wrapper.new(discogs_app_name, user_token: ENV['DISCOGS_PERSONAL_TOKEN'])
    search = discogs.search(params[:query], per_page: 10, type: params[:query_type])
    @results = search.results
  end
end
