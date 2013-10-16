require 'simplecov'
require 'coveralls'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start do
  add_filter 'vendor'
end

require 'recereco'
require 'minitest/autorun'
require 'webmock/minitest'

include WebMock::API

WebMock.disable_net_connect!(allow: 'coveralls.io')

def a_get(path)
  a_request(:get, Recereco::Configuration::ENDPOINT + path)
end

def stub_get(path)
  stub_request(:get, Recereco::Configuration::ENDPOINT + path)
end


def fixture_path
  File.expand_path("../fixtures", __FILE__)
end

def fixture(file)
  File.new(fixture_path + '/' + file).read
end
