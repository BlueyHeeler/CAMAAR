require 'rails_helper'

RSpec.describe "questaos/show", type: :view do
  before(:each) do
    assign(:questao, Questao.create!(
      nome: "Nome",
      texto: "MyText",
      tipo: "Tipo",
      template: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Tipo/)
    expect(rendered).to match(//)
  end
end
