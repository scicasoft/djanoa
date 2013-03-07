require 'djanoa/error'
require 'djanoa/response'

require 'uri'
require 'rest-client'

module Djanoa
  BASE_URL = "http://djanoa.com/sms/"
  class << self
    attr_writer :from, :account_code, :application_pass
    attr_reader :response

    # A method to allow configuration options to be set in a block
    # @return [Djanoa]
    def configure
      yield self
      self
    end

    # Send a new sms
    # @param phone [String]
    # @param message [String]
    # @return [Djanoa::Response]
    def send_sms phone, message
      message = URI.escape message
      response = RestClient.get "#{sender_base_url}/?from=#{@from}&to=#{phone}&text=#{message}&pass=#{@application_pass}"
      @response = Response.new response
    end

    private

    def sender_base_url
      "#{BASE_URL}#{@account_code}/out"
    end
  end
end