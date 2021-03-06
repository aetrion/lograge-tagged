require 'lograge'
require 'lograge_tagged/version'

module LogrageTagged
  class TaggedKeyValueFormatter < Lograge::Formatters::KeyValue
    def initialize(tag = "request.app")
      @tag = tag
    end
    def call(data)
      "[#{@tag}] #{super}"
    end
  end

  class Railtie < Rails::Railtie
    require 'lograge/railtie'

    config.after_initialize do |app|
      app.config.lograge.formatter = LogrageTagged::TaggedKeyValueFormatter.new
      app.config.lograge.custom_options = ->(event) { { params: event.payload[:params] } }
      if app.config.lograge.enabled
        Lograge.set_formatter
        Lograge.set_lograge_log_options
      end
    end
  end if defined?(Rails)
end
