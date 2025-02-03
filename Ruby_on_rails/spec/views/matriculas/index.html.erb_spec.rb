require 'rails_helper'

RSpec.describe "matriculas/index", type: :view do
  before(:each) do
    assign(:matriculas, [
      Matricula.create!(
        user: nil,
        turma: nil
      ),
      Matricula.create!(
        user: nil,
        turma: nil
      )
    ])
  end

  it "renders a list of matriculas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
