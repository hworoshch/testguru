require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Testguru
  class Application < Rails::Application
    config.load_defaults 5.2
    config.encoding = 'utf-8'
    config.time_zone = 'Novosibirsk'
    config.i18n.default_locale = :ru
  end
end
