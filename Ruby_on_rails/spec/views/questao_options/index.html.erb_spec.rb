require 'rails_helper'

RSpec.describe "questao_options/index", type: :view do
  before(:each) do
    assign(:questao_options, [
      QuestaoOption.create!(
        nome: "Nome",
        texto: "MyText",
        questao: nil
      ),
      QuestaoOption.create!(
        nome: "Nome",
        texto: "MyText",
        questao: nil
      )
    ])
  end

  it "renders a list of questao_options" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
