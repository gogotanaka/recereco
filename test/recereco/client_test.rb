require 'test_helper'

describe Recereco::Client do

  describe '#initialize' do
    it 'returns an instance of Recereco::Client' do
      Recereco::Client.new.must_be_instance_of Recereco::Client
    end
  end

  describe '#oauth_token_secret' do
    it 'does not have its getter method' do
      Recereco::Client.new.wont_respond_to :oauth_token_secret
    end
  end

  describe '#oauth_token?' do
    it 'returns true when both oauth_token and oauth_token_secret are set' do
      client = Recereco::Client.new(oauth_token: '1', oauth_token_secret: '1')
      client.oauth_token?.must_equal true
    end

    it 'returns false when only oauth_token is set' do
      client = Recereco::Client.new(oauth_token: '1')
      client.oauth_token?.must_equal false
    end

    it 'returns false when only oauth_token_secret is set' do
      client = Recereco::Client.new(oauth_token_secret: '1')
      client.oauth_token?.must_equal false
    end

    it 'returns false when neither oauth_token nor oauth_token_secret are set' do
      client = Recereco::Client.new
      client.oauth_token?.must_equal false
    end
  end

  describe '#credentials?' do

    describe 'with global keys' do
      before do
        Recereco.configure do |config|
          config.consumer_key = '12345'
          config.consumer_secret = 'abcde'
        end
      end

      after do
        Recereco.reset!
      end

      it 'returns true when all credentials are set' do
        client = Recereco::Client.new(oauth_token: '1', oauth_token_secret: '1')
        client.credentials?.must_equal true
      end
    end

    describe 'with no global keys' do
      it 'returns false when consumer info is not set' do
        client = Recereco::Client.new(oauth_token: '1', oauth_token_secret: '1')
        client.credentials?.must_equal false
      end

      it 'returns true when all credentials are set' do
        client = Recereco::Client.new(
          consumer_key: '12345',
          consumer_secret: 'abcde',
          oauth_token: '1',
          oauth_token_secret: '1'
        )
        client.credentials?.must_equal true
      end
    end

  end

end
