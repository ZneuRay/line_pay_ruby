module LinePayRuby
  class Payments
    class PreapprovedPay < BaseRequest
      
      # key getter
      def reg_key
        @base_id
      end

      # key setter
      def reg_key= (id)
        @base_id = id
      end

    end
  end
end