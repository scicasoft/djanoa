require 'rspec'

require_relative '../lib/djanoa/received_message.rb'

describe Djanoa::ReceivedMessage do

  context 'Empty params' do
    let(:message) { Djanoa::ReceivedMessage.new({}) }

    it 'should have no params by default' do
      expect(message.from).to be_nil
      expect(message.to).to be_nil
      expect(message.message).to be_nil
    end

    it 'should have no words' do
      expect(message.words).to be_empty
    end

  end

  context 'Valid params' do
    params = {from: "221", to: "223", text: "bonjour les gars"}
    let(:msg) { Djanoa::ReceivedMessage.new(params) }
    it 'should have a source' do
      expect(msg.from).to eq '221'
    end

    it 'should have a destination' do
      expect(msg.to).to eq '223'
    end

    it 'should have a message' do
      expect(msg.message).to eq 'bonjour les gars'
    end
  end

end
