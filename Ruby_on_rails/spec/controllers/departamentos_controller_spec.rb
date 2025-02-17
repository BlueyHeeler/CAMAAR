require 'rails_helper'

RSpec.describe DepartamentosController, type: :controller do
  let(:valid_attributes) {
    { nome: "Departamento Teste" }
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

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Departamento" do
        expect {
          post :create, params: { departamento: valid_attributes }
        }.to change(Departamento, :count).by(1)
      end

      it "redirects to the created departamento" do
        post :create, params: { departamento: valid_attributes }
        expect(response).to redirect_to(departamentos_path)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested departamento" do
      departamento = Departamento.create! valid_attributes
      expect {
        delete :destroy, params: { id: departamento.to_param }
      }.to change(Departamento, :count).by(-1)
    end

    it "redirects to the departamentos list" do
      departamento = Departamento.create! valid_attributes
      delete :destroy, params: { id: departamento.to_param }
      expect(response).to redirect_to(departamentos_url)
    end
  end
end
