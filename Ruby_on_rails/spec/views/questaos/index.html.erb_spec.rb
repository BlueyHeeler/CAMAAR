require 'rails_helper'

RSpec.describe "questaos/index", type: :view do
  before(:each) do
    assign(:questaos, [
      Questao.create!(
        nome: "Nome",
        texto: "MyText",
        tipo: "Tipo",
        template: nil
      ),
      Questao.create!(
        nome: "Nome",
        texto: "MyText",
        tipo: "Tipo",
        template: nil
      )
    ])
  end

  it "renders a list of questaos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Tipo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
