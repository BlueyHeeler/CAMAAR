require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    assign(:template, Template.create!(
      nome: "Nome",
      publico_alvo: "Publico Alvo",
      semestre: "Semestre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Publico Alvo/)
    expect(rendered).to match(/Semestre/)
  end
end
