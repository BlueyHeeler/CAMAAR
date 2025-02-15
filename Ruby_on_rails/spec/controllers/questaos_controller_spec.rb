require 'rails_helper'

RSpec.describe QuestaosController, type: :controller do
  let(:template) { Template.create(nome: "Template Teste") }
  let(:valid_attributes) {
    { enunciado: "Questao Teste", texto: "Texto Teste", template_id: 1 }
  }

  let(:invalid_attributes) {
    { enunciado: nil }
  }
end