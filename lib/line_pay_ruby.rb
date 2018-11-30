require "line_pay_ruby/version"

module LinePayRuby

  def self.config
    @@config ||= Configuration.new
  end

  def self.configure
    yield config
  end

end

require 'line_pay_ruby/configuration'
require 'line_pay_ruby/base_result'
require 'line_pay_ruby/base_request'
require 'line_pay_ruby/payments'
require 'line_pay_ruby/payments/confirm'
require 'line_pay_ruby/payments/refund'
require 'line_pay_ruby/payments/request'
require 'line_pay_ruby/payments/authorizations'
require 'line_pay_ruby/payments/authorizations/capture'
require 'line_pay_ruby/payments/authorizations/void'
require 'line_pay_ruby/payments/preapproved_pay'
require 'line_pay_ruby/payments/preapproved_pay/check'
require 'line_pay_ruby/payments/preapproved_pay/expire'
require 'line_pay_ruby/payments/preapproved_pay/payment'