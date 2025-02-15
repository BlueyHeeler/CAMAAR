require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "GET #login" do
    it "returns a success response" do
      get :login
      expect(response).to be_successful
    end
  end

  describe "GET #homepage" do
    it "returns a success response" do
      get :homepage
      expect(response).to be_successful
    end
  end

  describe "POST #import_data_classes" do
    it "handles import errors" do
      allow(Departamento).to receive(:find_or_create_by!).and_raise(StandardError, "Test error")
      post :import_data_classes, params: { imported_data: [].to_json, department_name: "Test Department" }
      expect(response).to redirect_to(home_homepage_path)
      expect(flash[:alert]).to eq("Failed to import classes: Test error")
    end
  end
end