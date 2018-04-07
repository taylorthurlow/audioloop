class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :discogs_app_name
  def discogs_app_name
    return "AudioLoop/#{Rails.configuration.app_version}"
  end
end
