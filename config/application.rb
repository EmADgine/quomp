require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Quomp
  class Application < Rails::Application
      config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif application.css.scss custom.css.scss *.js)
      config.action_controller.include_all_helpers = true
      config.autoload_paths+= %W(#{config.root}/app/models/legacy)
  end
end
