module LinePayRuby
  class Payments < BaseRequest
    
    # id getter
    def transaction_id
      @base_id
    end

    # id setter
    def transaction_id= (id)
      @base_id = id
    end

  end
end