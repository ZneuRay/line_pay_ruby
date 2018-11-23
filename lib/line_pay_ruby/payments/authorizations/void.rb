module LinePayRuby
  class Payments
    class Authorizations
      class Void < Authorizations
        REQUEST_METHOD = :post
      end
    end
  end
end