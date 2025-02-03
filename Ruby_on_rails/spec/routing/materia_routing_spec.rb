require "rails_helper"

RSpec.describe MateriaController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/materia").to route_to("materia#index")
    end

    it "routes to #new" do
      expect(get: "/materia/new").to route_to("materia#new")
    end

    it "routes to #show" do
      expect(get: "/materia/1").to route_to("materia#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/materia/1/edit").to route_to("materia#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/materia").to route_to("materia#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/materia/1").to route_to("materia#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/materia/1").to route_to("materia#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/materia/1").to route_to("materia#destroy", id: "1")
    end
  end
end
