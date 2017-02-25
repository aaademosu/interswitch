require "interswitch/version"
require "interswitch/helpers"
require "interswitch/configuration"
require "interswitch/form"

module Interswitch
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

# # start your engines
require "interswitch/engine" if defined?(Rails)
