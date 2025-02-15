require 'rails_helper'

RSpec.describe Turma, type: :model do
  it "is valid with valid attributes" do
    materium = Materium.create(nome: "Materia Teste")
    turma = Turma.new(codigo: "TST123", semestre: "2023/1", materium: materium)
    expect(turma).to be_valid
  end

  it "is valid without a horario" do
    materium = Materium.create(nome: "Materia Teste")
    turma = Turma.new(codigo: "TST123", semestre: "2023/1", materium: materium)
    expect(turma).to be_valid
  end

  it "is not valid without a materium" do
    turma = Turma.new(codigo: "TST123", semestre: "2023/1")
    expect(turma).to_not be_valid
  end

  it "belongs to a materium" do
    assoc = Turma.reflect_on_association(:materium)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many questionarios" do
    assoc = Turma.reflect_on_association(:questionarios)
    expect(assoc.macro).to eq :has_many
  end

  it "has many matriculas" do
    assoc = Turma.reflect_on_association(:matriculas)
    expect(assoc.macro).to eq :has_many
  end
end
