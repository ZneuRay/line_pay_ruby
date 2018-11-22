require 'net/https'
require 'json'

module LinePayRuby
  class BaseRequest

    API_VERSION = 'v2'

    def channel_id
      LinePayRuby.config.channel_id
    end

    def channel_secret
      LinePayRuby.config.channel_secret
    end

    def device_type
      LinePayRuby.config.merchant_device_type
    end

    def self.base_url
      mode = LinePayRuby.config.mode
      case mode
      when :real
        "https://api-pay.line.me/#{API_VERSION}/"
      when :beta
        "https://lgw-pay.line-apps-beta.com/#{API_VERSION}/"
      else
        "https://sandbox-api-pay.line.me/#{API_VERSION}/"
      end
    end

  end
end