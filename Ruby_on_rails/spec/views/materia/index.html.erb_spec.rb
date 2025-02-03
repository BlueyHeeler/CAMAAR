require 'rails_helper'

RSpec.describe "materia/index", type: :view do
  before(:each) do
    assign(:materia, [
      Materium.create!(
        nome: "Nome",
        codigo: "Codigo",
        departamento: nil
      ),
      Materium.create!(
        nome: "Nome",
        codigo: "Codigo",
        departamento: nil
      )
    ])
  end

  it "renders a list of materia" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Codigo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
