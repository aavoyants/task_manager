require "spec_helper"

describe ProjectsController do
  describe "routing" do
    it "routes to #index" do
      get("/").should route_to("projects#index")
      get("/projects").should route_to("projects#index")
    end

    it "routes to #create" do
      post("/projects").should route_to("projects#create")
    end

    it "routes to #update" do
      put("/projects/1").should route_to("projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/projects/1").should route_to("projects#destroy", :id => "1")
    end
  end
end
