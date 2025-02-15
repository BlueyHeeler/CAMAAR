require 'rails_helper'

RSpec.describe MateriaController, type: :controller do
  let(:valid_attributes) {
    { nome: "Materia Teste", departamento_id: 1 }
  }

  let(:invalid_attributes) {
    { nome: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { materium: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end