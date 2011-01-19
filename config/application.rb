require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "active_resource/railtie"
require "rails/test_unit/railtie"

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Whisper
  class Application < Rails::Application
    require 'whisper'
    config.encoding = "utf-8"
    config.filter_parameters += [:password]

    config.generators do |g|
      g.orm                 :my_generators
      g.integration_tool    :my_spec
      g.test_framework      :my_spec
      g.scaffold_controller :my_controller
      g.stylesheets         :my_stylesheets
      g.template_engine     :my_generators
    end
  end
end
