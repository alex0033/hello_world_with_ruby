require 'webrick'

op = {
    BindAdress: "127.0.1",
    Port: 3000,
    DocumentRoot: "."
}

WEBrick::HTTPServlet::FileHandler.add_handler("erb", WEBrick::HTTPServlet::ERBHandler)
s = WEBrick::HTTPServer.new(op)

# 以下、URLと表示ファイルの個別設定
s.mount('/', WEBrick::HTTPServlet::CGIHandler, 'home.rb')
s.mount('/next', WEBrick::HTTPServlet::CGIHandler, 'next.rb')

# 以下、URLと表示ファイルの個別設定
s.mount('/', WEBrick::HTTPServlet::FileHandler, 'app/views/basic_pages/home.html.erb')
s.mount('/next', WEBrick::HTTPServlet::FileHandler, 'app/views/basic_pages/next.html.erb')

s.start
