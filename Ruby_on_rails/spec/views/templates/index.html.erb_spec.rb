require 'rails_helper'

RSpec.describe "templates/index", type: :view do
  before(:each) do
    assign(:templates, [
      Template.create!(
        nome: "Nome",
        publico_alvo: "Publico Alvo",
        semestre: "Semestre"
      ),
      Template.create!(
        nome: "Nome",
        publico_alvo: "Publico Alvo",
        semestre: "Semestre"
      )
    ])
  end

  it "renders a list of templates" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Publico Alvo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Semestre".to_s), count: 2
  end
end
