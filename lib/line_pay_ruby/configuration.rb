module LinePayRuby

  class Configuration
    attr_accessor :channel_id
    attr_accessor :channel_secret
    attr_accessor :merchant_device_type

    # Mode should be in [:beta, :sandbox, :real]
    attr_accessor :mode

    def initialize
      @channel_id = nil
      @channel_secret = nil
      @merchant_device_type = nil
      @mode = :sandbox
    end
  end

end