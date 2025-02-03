require "rails_helper"

RSpec.describe RespondidosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/respondidos").to route_to("respondidos#index")
    end

    it "routes to #new" do
      expect(get: "/respondidos/new").to route_to("respondidos#new")
    end

    it "routes to #show" do
      expect(get: "/respondidos/1").to route_to("respondidos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/respondidos/1/edit").to route_to("respondidos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/respondidos").to route_to("respondidos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/respondidos/1").to route_to("respondidos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/respondidos/1").to route_to("respondidos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/respondidos/1").to route_to("respondidos#destroy", id: "1")
    end
  end
end
