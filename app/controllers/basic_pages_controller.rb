require 'erb'

def render_result(path)
    erb = ERB.new File.open("app/views/#{path}.html.erb").read
    erb.result(binding)
end

module BasicPagesController
    class HomeServlet < HTTPServlet::AbstractServlet
        def do_GET(req, res)
            @home_string = "pass homeServlet"
            res.body = render_result 'basic_pages/home'
        end
    end

    class NextServlet < HTTPServlet::AbstractServlet
        def do_GET(req, res)
            @next_string = "pass nextServlet"
            res.body = render_result 'basic_pages/next'
        end
    end
end
