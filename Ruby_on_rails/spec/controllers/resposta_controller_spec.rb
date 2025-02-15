require 'rails_helper'

RSpec.describe RespostaController, type: :controller do
  let(:valid_attributes) {
    { valor: "Resposta Teste", questao_id: questao.id, questionario_id: questionario.id, user_id: user.id }
  }

  let(:invalid_attributes) {
    { valor: nil }
  }

  let(:questao) { Questao.create(enunciado: "Questao Teste") }
  let(:questionario) { Questionario.create(nome: "Questionario Teste") }
  let(:user) { User.create(nome: "User Test", email: "user@test.com", password: "password") }

  describe "POST #create" do
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { respostas: [invalid_attributes] }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end