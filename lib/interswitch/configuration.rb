module Interswitch
  class Configuration
    attr_accessor :interswitch_redirect_path, :url

    def initialize
      @interswitch_redirect_path = '/'
      @url = 'https://sandbox.interswitchng.com/webpay/api/v1/gettransaction.json?'
    end
  end
end
