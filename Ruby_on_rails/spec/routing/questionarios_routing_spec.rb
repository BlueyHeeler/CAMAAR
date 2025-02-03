require "rails_helper"

RSpec.describe QuestionariosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/questionarios").to route_to("questionarios#index")
    end

    it "routes to #new" do
      expect(get: "/questionarios/new").to route_to("questionarios#new")
    end

    it "routes to #show" do
      expect(get: "/questionarios/1").to route_to("questionarios#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/questionarios/1/edit").to route_to("questionarios#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/questionarios").to route_to("questionarios#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/questionarios/1").to route_to("questionarios#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/questionarios/1").to route_to("questionarios#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/questionarios/1").to route_to("questionarios#destroy", id: "1")
    end
  end
end
