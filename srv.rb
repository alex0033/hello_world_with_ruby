require 'webrick'
include WEBrick

op = {
    BindAdress: "127.0.1",
    Port: 3000,
    DocumentRoot: "."
}

s = HTTPServer.new(op)

# Stringクラスの拡張
class String
    def to_camel()
        self.split("_").map{ |w| w[0] = w[0].upcase; w }.join
    end
end

# ルーティングの読み込み
require './config/routes.rb'
r = Routes.new
routes = r.make_routes

routes.each do |route|
    require "./app/controllers/#{route[:controller_name]}_controller.rb"
    include eval("#{route[:controller_name].to_camel}Controller")

    s.mount route[:url], eval("#{route[:action].to_camel}Servlet")
end

trap(:INT){ s.shutdown }
s.start
