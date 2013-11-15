require 'lograge'
require 'lograge_tagged/version'

module LogrageTagged
  class TaggedKeyValueFormatter < Lograge::Formatters::KeyValue
    def call(data)
      "[request.app] #{super}"
    end
  end

  class Railtie < Rails::Railtie
    initializer "lograge-tagged", before: :lograge do |app|
      app.config.lograge.formatter = LogrageTagged::TaggedKeyValueFormatter.new
      app.config.lograge.custom_options = ->(event) { { params: event.payload[:params] } }
    end
  end if defined?(Rails)
end
