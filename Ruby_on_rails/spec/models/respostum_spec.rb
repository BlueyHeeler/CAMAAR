require 'rails_helper'

RSpec.describe Respostum, type: :model do
  it "is valid with valid attributes" do
    questao = Questao.create(enunciado: "Questao Teste")
    questionario = Questionario.create(nome: "Questionario Teste")
    respostum = Respostum.new(valor: "Resposta Teste", questao: questao, questionario: questionario)
    expect(respostum).to be_valid
  end

  it "is not valid without a questao" do
    questionario = Questionario.create(nome: "Questionario Teste")
    respostum = Respostum.new(valor: "Resposta Teste", questionario: questionario)
    expect(respostum).to_not be_valid
  end

  it "is not valid without a questionario" do
    questao = Questao.create(enunciado: "Questao Teste")
    respostum = Respostum.new(valor: "Resposta Teste", questao: questao)
    expect(respostum).to_not be_valid
  end

  it "belongs to a questao" do
    assoc = Respostum.reflect_on_association(:questao)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a questionario" do
    assoc = Respostum.reflect_on_association(:questionario)
    expect(assoc.macro).to eq :belongs_to
  end
end
