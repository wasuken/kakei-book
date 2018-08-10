require "./main"
require "minitest/autorun"
require "rack/test"

ENV['RACK_ENV'] = 'test'


class ServeTest < MiniTest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def current_response_ok?
    get '/'
    assert last_response.ok?
  end
  def current_response_ok?
    get '/items'
    assert last_response.ok?
  end
end
