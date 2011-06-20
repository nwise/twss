require "spec_helper"

describe TwssesController do
  describe "routing" do

    it "routes to #index" do
      get("/twsses").should route_to("twsses#index")
    end

    it "routes to #new" do
      get("/twsses/new").should route_to("twsses#new")
    end

    it "routes to #show" do
      get("/twsses/1").should route_to("twsses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/twsses/1/edit").should route_to("twsses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/twsses").should route_to("twsses#create")
    end

    it "routes to #update" do
      put("/twsses/1").should route_to("twsses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/twsses/1").should route_to("twsses#destroy", :id => "1")
    end

  end
end
