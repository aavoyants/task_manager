require "spec_helper"

describe TasksController do
  describe "routing" do
    it "routes to #create" do
      post("/tasks").should route_to("tasks#create")
    end

    it "routes to #update" do
      put("/tasks/1").should route_to("tasks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tasks/1").should route_to("tasks#destroy", :id => "1")
    end
  end
end
