class ArtistsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_artist, only: [:show, :destroy]

  respond_to :html

  def index
    @artists = Artist.all
    respond_with @artists
  end

  def show
    respond_with @artist
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to @artist
  end

  def destroy
    @artist.destroy
    respond_with @artist
  end

  private

  def set_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    params.require(:artist).permit(:name, :description, :image_url, :discogs_id)
  end
end
