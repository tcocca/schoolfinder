$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'schoolfinder'
require 'spec'
require 'spec/autorun'
require 'webmock/rspec'

Spec::Runner.configure do |config|
  config.include WebMock
end

def default_params
  {"v" => "3", "key" => "some_key", "resf" => "json", "sn" => "sf"}
end

def mock_get(params, response_fixture)
  stub_http_request(:get, "api.education.com/service/service.php").with(:query => default_params.merge(params)).to_return(:body => mocked_body(response_fixture))
end

def mocked_body(response_fixture)
  File.read(File.join(File.dirname(__FILE__), 'responses', response_fixture))
end
