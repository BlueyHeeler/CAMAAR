require 'rails_helper'

RSpec.describe "questionarios/index", type: :view do
  before(:each) do
    assign(:questionarios, [
      Questionario.create!(
        nome: "Nome",
        turma: nil,
        template: nil
      ),
      Questionario.create!(
        nome: "Nome",
        turma: nil,
        template: nil
      )
    ])
  end

  it "renders a list of questionarios" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
