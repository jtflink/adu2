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

get "/existingadu" do
        view "existingadu"
end

get "/adutypeback" do
    view "adutype"
end

get "/parking" do
    if params["existingadu"] == "2"
        view "parking"
    else
        view "existingadu_ne"
    end
end

get "/eligible" do
    if params["parking"] == "1"
        view "eligible"
    elsif params["parking"] == "2"
        view "eligible"
    elsif params["parking"] == "3"
        view "eligible"
    elsif params["parking"] == "1" && params["parking"] == "2"
        view "eligible"
    elsif params["parking"] == "2" && params["parking"] == "3"
        view "eligible"
    elsif params["parking"] == "1" && params["parking"] == "2" && params["parking"] == "3"
        view "eligible"
    else
        view "parking2"
    end
end

get "/parkingback" do
    view "parking"
end

get "/parking2back" do
    view "parking2"
end

get "/eligible2" do
    if params["parking2"] == "1"
        view "eligible"
    else
        view "parking_ne"
    end
end