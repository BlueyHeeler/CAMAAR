require 'rails_helper'

RSpec.describe "questao_options/show", type: :view do
  before(:each) do
    assign(:questao_option, QuestaoOption.create!(
      nome: "Nome",
      texto: "MyText",
      questao: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
