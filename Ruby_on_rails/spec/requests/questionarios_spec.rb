require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/questionarios", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Questionario. As you add validations to Questionario, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Questionario.create! valid_attributes
      get questionarios_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      questionario = Questionario.create! valid_attributes
      get questionario_url(questionario)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_questionario_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      questionario = Questionario.create! valid_attributes
      get edit_questionario_url(questionario)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Questionario" do
        expect {
          post questionarios_url, params: { questionario: valid_attributes }
        }.to change(Questionario, :count).by(1)
      end

      it "redirects to the created questionario" do
        post questionarios_url, params: { questionario: valid_attributes }
        expect(response).to redirect_to(questionario_url(Questionario.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Questionario" do
        expect {
          post questionarios_url, params: { questionario: invalid_attributes }
        }.to change(Questionario, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post questionarios_url, params: { questionario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested questionario" do
        questionario = Questionario.create! valid_attributes
        patch questionario_url(questionario), params: { questionario: new_attributes }
        questionario.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the questionario" do
        questionario = Questionario.create! valid_attributes
        patch questionario_url(questionario), params: { questionario: new_attributes }
        questionario.reload
        expect(response).to redirect_to(questionario_url(questionario))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        questionario = Questionario.create! valid_attributes
        patch questionario_url(questionario), params: { questionario: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested questionario" do
      questionario = Questionario.create! valid_attributes
      expect {
        delete questionario_url(questionario)
      }.to change(Questionario, :count).by(-1)
    end

    it "redirects to the questionarios list" do
      questionario = Questionario.create! valid_attributes
      delete questionario_url(questionario)
      expect(response).to redirect_to(questionarios_url)
    end
  end
end
