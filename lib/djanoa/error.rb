module Djanoa
  class Error
    attr_reader :code, :message, :ip

    # Instantiates a new django error object
    # @param code [Integer]
    # @param message [String]
    # @param ip [String]
    # @return [Djanoa::Error]

    def initialize code, message, ip
      @code = code
      @message = message
      @ip = ip
      self
    end
  end
end