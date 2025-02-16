require 'rails_helper'

RSpec.describe Questao, type: :model do
  it "is valid with valid attributes" do
    template = Template.create(nome: "Template Test")
    questao = Questao.new(enunciado: "Enunciado Teste", template: template)
    expect(questao).to be_valid
  end

  it "is not valid without an enunciado" do
    template = Template.create(nome: "Template Test")
    questao = Questao.new(template: template)
    expect(questao).to_not be_valid
  end

  it "belongs to a template" do
    assoc = Questao.reflect_on_association(:template)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many respostas" do
    assoc = Questao.reflect_on_association(:respostas)
    expect(assoc.macro).to eq :has_many
  end
end
