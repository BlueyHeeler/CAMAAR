require 'rails_helper'

RSpec.describe "departamentos/index", type: :view do
  before(:each) do
    assign(:departamentos, [
      Departamento.create!(
        nome: "Nome"
      ),
      Departamento.create!(
        nome: "Nome"
      )
    ])
  end

  it "renders a list of departamentos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
  end
end
