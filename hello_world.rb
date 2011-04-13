#!/usr/bin/env ruby
$:<< '../lib' << 'lib'

require 'goliath'

class HelloWorld < Goliath::API
  def response(env)
    [200, {"Content-Type" => "text/html"}, "Hello World"]
  end
end