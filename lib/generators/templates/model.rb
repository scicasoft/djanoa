class DjanoaMessage < ActiveRecord::Base
  attr_accessible :from, :to, :message

  # Return the words off the sms
  # @return [Array]

  def words
    message.split
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