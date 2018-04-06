require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AudioLoop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Add bower components to asset path
    # config.assets.paths << "#{Rails.root}/app/assets/bower_components"

    # Autoload files in lib directory
    config.eager_load_paths << "#{Rails.root}/lib"

    # Configure default Rails generators
    config.generators do |g|
        # Don't generate scaffold.scss stylesheet
        g.scaffold_stylesheet false

        # Don't generate scaffold stylesheets, helpers, or javascripts
        g.assets false
        g.helper false

        # Use a custom scaffold template engine so we can change things
        g.template_engine :all
        g.fallbacks[:all] = :erb
    end
  end
end
