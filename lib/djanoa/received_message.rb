module Djanoa
  class ReceivedMessage
    attr_reader :from, :to, :message

    # Instantiates a new response object
    # @param params [Hash]
    # @return [Djanoa::ReceivedSms]

    def initialize params
      @from    = params[:from]
      @to      = params[:to]
      @message = params[:text]
      self
    end

    # Return the words off the sms
    # @return [Array]

    def words
      @message ? @message.split : []
    end

    def method_missing(m, *args)
      if m.to_s[/word_(.+)_exists?/]
        return false if $1.to_i.zero?
        return !words[$1.to_i-1].nil?
      elsif m.to_s[/word_(.+)/]
        return nil if $1.to_i.zero?
        return words[$1.to_i-1]
      else
        super
      end
    end
  end
end
