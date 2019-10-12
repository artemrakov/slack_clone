require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module SlackClone
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :rspec,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end

    config.load_defaults 5.2
  end
end
