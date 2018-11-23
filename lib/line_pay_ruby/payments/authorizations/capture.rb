module LinePayRuby
  class Payments
    class Authorizations
      class Capture < Authorizations
        REQUEST_METHOD = :post
      end
    end
  end
end