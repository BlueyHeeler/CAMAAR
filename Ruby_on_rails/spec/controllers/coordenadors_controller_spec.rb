require 'rails_helper'

RSpec.describe CoordenadorsController, type: :controller do
  let(:valid_attributes) {
    { departamento_id: 1, user_id: 1 }
  }

  let(:invalid_attributes) {
    { departamento_id: nil, user_id: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { coordenador: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
