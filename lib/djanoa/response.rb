require 'nokogiri'

module Djanoa
  class Response
    attr_reader :sent, :error

    # Instantiates a new response object
    # @param response [String]
    # @return [Djanoa::Response]

    def initialize response = ""
      doc = Nokogiri::Slop response
      @sent = doc.root.name == "DjanoaResponse"
      unless @sent
        code = doc.DjanoaError.Code.content.to_i
        message = doc.DjanoaError.Error.content
        ip = doc.DjanoaError.IP.content
        @error = Error.new code, message, ip
      end

      self
    end

    # @return [Boolean]
    def sent?
      return @sent
    end
  end
end