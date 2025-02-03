require 'rails_helper'

RSpec.describe "turmas/index", type: :view do
  before(:each) do
    assign(:turmas, [
      Turma.create!(
        codigo: "Codigo",
        semestre: "Semestre",
        materia: nil
      ),
      Turma.create!(
        codigo: "Codigo",
        semestre: "Semestre",
        materia: nil
      )
    ])
  end

  it "renders a list of turmas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Codigo".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Semestre".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
