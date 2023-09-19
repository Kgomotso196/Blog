# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# The `Hellorails::Application` class is the main application configuration
# for the Hellorails application.
module Blog
  # It includes settings and configurations
  # for the Rails application.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    require 'dotenv/rails-now'
    config.load_defaults 7.0
    Dotenv::Railtie.load

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
