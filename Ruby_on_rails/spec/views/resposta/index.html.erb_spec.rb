require 'rails_helper'

RSpec.describe "resposta/index", type: :view do
  before(:each) do
    assign(:resposta, [
      Respostum.create!(
        valor: "Valor",
        questao: nil,
        questionario: nil
      ),
      Respostum.create!(
        valor: "Valor",
        questao: nil,
        questionario: nil
      )
    ])
  end

  it "renders a list of resposta" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Valor".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
