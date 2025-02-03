require 'rails_helper'

RSpec.describe "resposta/show", type: :view do
  before(:each) do
    assign(:respostum, Respostum.create!(
      valor: "Valor",
      questao: nil,
      questionario: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Valor/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
