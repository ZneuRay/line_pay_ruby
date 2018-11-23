require 'net/https'
require 'json'

module LinePayRuby
  class BaseRequest

    REQUEST_METHOD = :get
    API_VERSION = 'v2'

    def initialize id=nil
      @base_id = id
    end

    def channel_id
      LinePayRuby.config.channel_id
    end

    def channel_secret
      LinePayRuby.config.channel_secret
    end

    def device_type
      LinePayRuby.config.merchant_device_type
    end

    def service_url
      BaseRequest.base_url + build_path
    end

    def request(params=nil)
      send_request(self.class::REQUEST_METHOD, params)
    end

    def last_result
      @res
    end

    private

    def send_request(method=:get, params=nil)
      uri = URI(service_url)

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      http.read_timeout = 50

      req = nil
      if method == :post
        req = Net::HTTP::Post.new(uri)
      else
        req = Net::HTTP::Get.new(uri)
      end
      req.add_field "Content-Type", "application/json"
      req.add_field "X-LINE-ChannelId", channel_id
      req.add_field "X-LINE-ChannelSecret", channel_secret
      req.add_field "X-LINE-MerchantDeviceType", device_type if device_type
      req.body = params.to_json

      @res = http.request(req)
      @res
    end

    def build_path
      path = self.class.name.downcase.split('::').drop(1)
      path.insert(-2, @base_id) if @base_id
      path.join('/')
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