require 'rails_helper'

RSpec.describe TemplatesController, type: :controller do
  let(:valid_attributes) {
    { nome: "Template Teste", publico_alvo: "Publico Teste", semestre: "2023/1" }
  }

  let(:invalid_attributes) {
    { nome: nil }
  }

  describe "GET #show" do
    it "returns a success response" do
      template = Template.create! valid_attributes
      get :show, params: { id: template.to_param }
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
    context "with valid params" do
      it "creates a new Template" do
        expect {
          post :create, params: { template: valid_attributes }
        }.to change(Template, :count).by(1)
      end

      it "redirects to the created template" do
        post :create, params: { template: valid_attributes }
        expect(response).to redirect_to(home_gerenciamento_templates_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { template: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested template" do
      template = Template.create! valid_attributes
      expect {
        delete :destroy, params: { id: template.to_param }
      }.to change(Template, :count).by(-1)
    end

    it "redirects to the templates list" do
      template = Template.create! valid_attributes
      delete :destroy, params: { id: template.to_param }
      expect(response).to redirect_to(home_gerenciamento_templates_path)
    end
  end
end