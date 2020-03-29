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

get "/home_type" do
    view "home_type"
end