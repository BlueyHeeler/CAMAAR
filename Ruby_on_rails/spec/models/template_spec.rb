require 'rails_helper'

RSpec.describe Template, type: :model do
  it "is valid with valid attributes" do
    template = Template.new(nome: "Template Test", publico_alvo: "Publico Teste", semestre: "2023/1")
    expect(template).to be_valid
  end

  it "is not valid without a nome" do
    template = Template.new(publico_alvo: "Publico Teste", semestre: "2023/1")
    expect(template).to_not be_valid
  end

  it "is not valid without a publico_alvo" do
    template = Template.new(nome: "Template Test", semestre: "2023/1")
    expect(template).to_not be_valid
  end

  it "is not valid without a semestre" do
    template = Template.new(nome: "Template Test", publico_alvo: "Publico Teste")
    expect(template).to_not be_valid
  end

  it "has many questaos" do
    assoc = Template.reflect_on_association(:questaos)
    expect(assoc.macro).to eq :has_many
  end

  it "accepts nested attributes for questaos" do
    template = Template.new(nome: "Template Test", publico_alvo: "Publico Teste", semestre: "2023/1", questaos_attributes: [{ enunciado: "Questao Teste" }])
    expect(template.questaos.first.enunciado).to eq("Questao Teste")
  end

  it "destroys associated questaos when deleted" do
    template = Template.create(nome: "Template Test", publico_alvo: "Publico Teste", semestre: "2023/1")
    questao = template.questaos.create(enunciado: "Questao Teste")
    expect { template.destroy }.to change { Questao.count }.by(-1)
  end
end
