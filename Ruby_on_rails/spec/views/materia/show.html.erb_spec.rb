require 'rails_helper'

RSpec.describe "materia/show", type: :view do
  before(:each) do
    assign(:materium, Materium.create!(
      nome: "Nome",
      codigo: "Codigo",
      departamento: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Codigo/)
    expect(rendered).to match(//)
  end
end
