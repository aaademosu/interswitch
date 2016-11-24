module Interswitch
  class Configuration
    attr_accessor :interswitch_redirect_path

    def initialize
      @interswitch_redirect_path = '/'
    end
  end


  def self.configure
    yield(configuration)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  # Set Transactor's configuration
  # @param config [Interswitch::Configuration]
  def self.configuration=(config)
    @configuration = config
  end
end
