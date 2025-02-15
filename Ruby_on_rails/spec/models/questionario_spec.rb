require 'rails_helper'

RSpec.describe Questionario, type: :model do

  it "is not valid without a turma" do
    template = Template.create(nome: "Template Teste")
    user = User.create(nome: "User Test", email: "user@test.com", password: "password")
    questionario = Questionario.new(nome: "Questionario Teste", template: template, user: user)
    expect(questionario).to_not be_valid
  end

  it "belongs to a turma" do
    assoc = Questionario.reflect_on_association(:turma)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a template" do
    assoc = Questionario.reflect_on_association(:template)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a user" do
    assoc = Questionario.reflect_on_association(:user)
    expect(assoc.macro).to eq :belongs_to
  end

  it "has many respostas" do
    assoc = Questionario.reflect_on_association(:respostas)
    expect(assoc.macro).to eq :has_many
  end
end
