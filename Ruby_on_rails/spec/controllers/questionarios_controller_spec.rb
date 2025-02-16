require 'rails_helper'

RSpec.describe QuestionariosController, type: :controller do
  let(:valid_attributes) {
    { nome: "Questionario Teste", turma_id: 1, template_id: 1, user_id: 1 }
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

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { questionario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
