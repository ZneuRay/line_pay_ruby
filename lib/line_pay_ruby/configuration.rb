module LinePayRuby

  class Configuration
    attr_accessor :channel_id
    attr_accessor :channel_secret
    attr_accessor :merchant_device_type

    # Mode should be in [:beta, :sandbox, :real]
    attr_accessor :mode

    def initialize
      @channel_id = ''
      @channel_secret = ''
      @merchant_device_type = ''
      @mode = :sandbox
    end
  end

end