module LinePayRuby
  class BaseResult

    attr_accessor :result
    
    def initialize result
      if result && result.is_a?(Net::HTTPOK)
        @result = result
        @json = JSON.parse(result.body)
      end
    end

    def success?
      return true if code == '0000'
      false
    end

    # LinePay return code
    def code
      return @json['returnCode'] if @json
      nil
    end

    # LinePay return message
    def message
      return @json['returnMessage'] if @json
      nil
    end

    # LinePay response
    def data
      return @json['info'] if @json
      nil
    end

    # Check http status code
    def is_http_ok?
      return true if @result && @result.code == '200'
      false
    end

    # Return http result code
    def http_code
      @result.code
    end

    # Return http result body
    def http_body
      @result.body
    end

  end
end