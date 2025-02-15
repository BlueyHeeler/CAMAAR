require 'rails_helper'

RSpec.describe Materium, type: :model do
  it "is valid with valid attributes" do
    departamento = Departamento.create(nome: "Departamento Teste")
    materium = Materium.new(nome: "Materia Teste", departamento: departamento)
    expect(materium).to be_valid
  end

  it "is not valid without a departamento" do
    materium = Materium.new(nome: "Materia Teste")
    expect(materium).to_not be_valid
  end

  it "belongs to a departamento" do
    assoc = Materium.reflect_on_association(:departamento)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many turmas" do
    assoc = Materium.reflect_on_association(:turmas)
    expect(assoc.macro).to eq :has_many
  end
end
