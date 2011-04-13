require 'eventmachine'
require 'evma_httpserver'
 
class Handler  < EventMachine::Connection
  include EventMachine::HttpServer
  def post_init
    super
    no_environment_strings
  end
 
  def process_http_request
    resp = EventMachine::DelegatedHttpResponse.new( self )
    resp.status = 200
    resp.content_type "text/html"
    resp.content = "Hello World"
    resp.send_response 
  end
end
 
EventMachine::run {
  EventMachine::start_server("0.0.0.0", 8082, Handler)
  puts "Listening...8082"
}