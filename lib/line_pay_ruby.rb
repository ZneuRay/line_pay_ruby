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
require 'line_pay_ruby/base_request'