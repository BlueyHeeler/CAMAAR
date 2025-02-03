require "rails_helper"

RSpec.describe CoordenadorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/coordenadors").to route_to("coordenadors#index")
    end

    it "routes to #new" do
      expect(get: "/coordenadors/new").to route_to("coordenadors#new")
    end

    it "routes to #show" do
      expect(get: "/coordenadors/1").to route_to("coordenadors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/coordenadors/1/edit").to route_to("coordenadors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/coordenadors").to route_to("coordenadors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/coordenadors/1").to route_to("coordenadors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/coordenadors/1").to route_to("coordenadors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/coordenadors/1").to route_to("coordenadors#destroy", id: "1")
    end
  end
end
