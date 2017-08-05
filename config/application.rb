require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Asagao
  class Application < Rails::Application
    config.generators do |g|
      g.javascripts false
      g.helper false
      g.test_framework false
    end
    config.active_record.raise_in_transactional_callbacks = true
    config.time_zone = "Tokyo"

    config.action_controller.permit_all_parameters = true

    # 日本語化
    config.i18n.default_locale = :ja
  end
end
