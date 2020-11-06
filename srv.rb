require 'webrick'
require 'erb'

include WEBrick

op = {
    BindAdress: "127.0.1",
    Port: 3000,
    DocumentRoot: "."
}

s = HTTPServer.new(op)

# サーブレット
class HomeServlet < HTTPServlet::AbstractServlet
    def do_GET(req, res)
        @home_string = "pass homeServlet"
        res['Content-Type'] = "text/html"
        erb = ERB.new File.open('app/views/basic_pages/home.html.erb').read
        res.body = erb.result(binding)
    end
end

class NextServlet < HTTPServlet::AbstractServlet
    def do_GET(req, res)
        @next_string = "pass nextServlet"
        res['Content-Type'] = "text/html"
        erb = ERB.new File.open('app/views/basic_pages/next.html.erb').read
        res.body = erb.result(binding)
    end
end

s.mount('/', HomeServlet)
s.mount('/next', NextServlet)
trap(:INT){ s.shutdown }
s.start
