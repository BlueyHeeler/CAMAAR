require 'rails_helper'

RSpec.describe Matricula, type: :model do

  it "is not valid without a turma" do
    user = User.create(nome: "User Test", email: "user@test.com", password: "password")
    matricula = Matricula.new(estudante: user)
    expect(matricula).to_not be_valid
  end

  it "belongs to an estudante" do
    assoc = Matricula.reflect_on_association(:estudante)
    expect(assoc.macro).to eq :belongs_to
  end

  it "belongs to a turma" do
    assoc = Matricula.reflect_on_association(:turma)
    expect(assoc.macro).to eq :belongs_to
  end
end
