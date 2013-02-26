require 'lograge'
require 'lograge_tagged/version'

module LogrageTagged
  module LogSubscriber
    # A custom formatter for Lograge logs.
    #
    # This formatter delegates the log generation to +process_action_lograge+,
    # but it also appends a custom prefix for lookup.
    def process_action_tagged(*args)
      output = process_action_lograge(*args)
      "[request.app] #{output}"
    end
  end

  class Railtie < Rails::Railtie
    initializer "lograge-tagged.initialize" do |app|
      app.config.lograge.log_format = :tagged
      app.config.lograge.custom_options = ->(event) {
        { params: event.payload[:params] }
      }
    end
  end if defined?(Rails)
end

Lograge::RequestLogSubscriber.send(:include, LogrageTagged::LogSubscriber)
