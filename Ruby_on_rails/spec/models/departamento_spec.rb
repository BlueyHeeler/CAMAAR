require 'rails_helper'

RSpec.describe Departamento, type: :model do
  it "is valid with valid attributes" do
    departamento = Departamento.new(nome: "Departamento Teste")
    expect(departamento).to be_valid
  end

  it "has many materiums" do
    assoc = Departamento.reflect_on_association(:materiums)
    expect(assoc.macro).to eq :has_many
  end

  it "can have multiple materiums" do
    departamento = Departamento.create(nome: "Departamento Teste")
    departamento.materiums.create(nome: "Materia Teste 1")
    departamento.materiums.create(nome: "Materia Teste 2")
    expect(departamento.materiums.count).to eq(2)
  end
end
