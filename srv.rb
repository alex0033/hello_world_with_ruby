require 'webrick'
include WEBrick

op = {
    BindAdress: "127.0.1",
    Port: 3000,
    DocumentRoot: "."
}

s = HTTPServer.new(op)

require './app/controllers/basic_pages_controller.rb'
include BasicPagesController

s.mount('/', HomeServlet)
s.mount('/next', NextServlet)

trap(:INT){ s.shutdown }
s.start
