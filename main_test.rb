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
  def post_date_json_ok?
    get '/json'
  end
  def put_date_json_ok?
    get '/json'
  end
  def delete_date_json_ok?
    get '/json'
  end
end
