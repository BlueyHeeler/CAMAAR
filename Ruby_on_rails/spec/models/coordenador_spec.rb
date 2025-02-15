require 'rails_helper'

RSpec.describe Coordenador, type: :model do
  it "is valid with valid attributes" do
    departamento = Departamento.create(nome: "Departamento de Teste")
    user = User.create(nome: "User Test", email: "user@test.com", password: "password")
    coordenador = Coordenador.new(departamento: departamento, user: user)
    expect(coordenador).to be_valid
  end

  it "is not valid without a departamento" do
    user = User.create(nome: "User Test", email: "user@test.com", password: "password")
    coordenador = Coordenador.new(user: user)
    expect(coordenador).to_not be_valid
  end

  it "is not valid without a user" do
    departamento = Departamento.create(nome: "Departamento de Teste")
    coordenador = Coordenador.new(departamento: departamento)
    expect(coordenador).to_not be_valid
  end

  it "belongs to a departamento" do
    assoc = Coordenador.reflect_on_association(:departamento)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a user" do
    assoc = Coordenador.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end
end
