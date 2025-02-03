require "rails_helper"

RSpec.describe QuestaoOptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/questao_options").to route_to("questao_options#index")
    end

    it "routes to #new" do
      expect(get: "/questao_options/new").to route_to("questao_options#new")
    end

    it "routes to #show" do
      expect(get: "/questao_options/1").to route_to("questao_options#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/questao_options/1/edit").to route_to("questao_options#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/questao_options").to route_to("questao_options#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/questao_options/1").to route_to("questao_options#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/questao_options/1").to route_to("questao_options#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/questao_options/1").to route_to("questao_options#destroy", id: "1")
    end
  end
end
