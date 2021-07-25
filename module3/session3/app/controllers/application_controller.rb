require "sinatra/base"

class ApplicationController < Sinatra::Base
    configure do
        enable :method_override
        set :public_dir, "public"
        set :views, "app/views"
    end
end
