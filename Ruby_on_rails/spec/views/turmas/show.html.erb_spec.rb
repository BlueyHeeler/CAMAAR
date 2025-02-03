require 'rails_helper'

RSpec.describe "turmas/show", type: :view do
  before(:each) do
    assign(:turma, Turma.create!(
      codigo: "Codigo",
      semestre: "Semestre",
      materia: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(/Semestre/)
    expect(rendered).to match(//)
  end
end
