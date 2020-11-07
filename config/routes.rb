class Routes
    def initialize
        @routes = Array.new
    end

    def make_routes
        # 下記にルートを記載
        get "/", "basic_pages", "home"
        get "/next", "basic_pages", "next"

        # 下記に返り値を記載(ルート情報の一覧を返す)
        return @routes
    end

    def get(url, controller_name, action)
        @routes.push({ url: url, controller_name: controller_name, action: action }) 
    end
end