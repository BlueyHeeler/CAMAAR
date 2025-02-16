require 'rails_helper'

RSpec.describe TurmasController, type: :controller do
  let(:valid_attributes) {
    { codigo: "TST123", semestre: "2023/1", horario: "10:00", materium_id: materium.id }
  }

  let(:invalid_attributes) {
    { codigo: nil }
  }

  let(:materium) { Materium.create(nome: "Materia Teste") }

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { turma: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
