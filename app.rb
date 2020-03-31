require "sinatra"
require "sinatra/reloader"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }

get "/" do
    view "start"
end

get "/address" do
    @first_name = params["first_name"]

    view "address"
end

get "/hometype" do
        view "hometype"
end

get "/adutype" do
    if params["hometype"] == "1"
        view "adutype"
    else
        view "hometype_ne"
    end
end