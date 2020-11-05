require 'webrick'

op = {
    BindAdress: "127.0.1",
    Port: 10080,
    DocumentRoot: "app/views/home.html.erb"
}

WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)
s = WEBrick::HTTPServer.new(op)

s.start
