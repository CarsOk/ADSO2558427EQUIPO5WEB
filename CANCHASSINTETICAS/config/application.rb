require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CANCHASSINTETICAS
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.assets.enabled = true
    config.assets.version = '1.0'

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.to_prepare do
      Devise::SessionsController.layout "login"
      Devise::ConfirmationsController.layout "login"
      Devise::UnlocksController.layout "login"            
      Devise::PasswordsController.layout "login"
    end
  end
end
