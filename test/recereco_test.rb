require 'test_helper'

describe Recereco do

  after do
    Recereco.reset!
  end

  describe '.client' do
    it 'returns an instance of Recereco::Client' do
      Recereco.client.must_be_instance_of Recereco::Client
    end
  end

  describe '.method_missing' do
    it 'delegates to Recereco::Client' do
      Recereco.oauth_token?.must_equal false
    end

    it 'raises NoMethodError when undefined method is called' do
      -> { Recereco.undefined }.must_raise NoMethodError
    end
  end

end