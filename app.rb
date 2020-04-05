require "sinatra"
require "sinatra/reloader"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }

get "/" do
    view "start"
end

get "/address" do
    @@first_name = params["first_name"]

    view "address"
end

get "/address2" do
    @@first_name

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
    @@adutype = params["adutype"]
    
    view "existingadu"
end

get "/existingaduback" do
    view "existingadu"
end

get "/adutypeback" do
    view "adutype"
end

get "/parking" do
    if params["existingadu"] == "2"
        if @@adutype == "1"
            view "conversion"
        else @@adutype == "2" || @@adutype == "3"
            view "parking"
        end
    else
        view "existingadu_ne"
    end
end

get "/eligible" do
    if params["parking"] == "1" || params["parking"] == "2" || params["parking"] == "3"
        if @@adutype == "1"
            view "eligible"
        else 
            view "eligible2"
        end
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

get "/eligibleparking" do
    if params["parking2"] == "1"
        if @@adutype == "1"
            view "eligible"
        else 
            view "eligible2"
        end
    else
        view "parking_ne"
    end
end

get "/eligibleconversion" do
    if params["eligibleconversion"] == "1"
        if @@adutype == "1"
            view "eligibleconversion2"
        else 
            view "eligibleconversion"
        end
    else
        if @@adutype == "1"
            view "conversion_ne_1"
        else
            view "conversion_ne_2"
        end
    end
end

get "/conversion" do
    view "conversion"
end