require 'rails_helper'

RSpec.describe "coordenadors/index", type: :view do
  before(:each) do
    assign(:coordenadors, [
      Coordenador.create!(
        departamento: nil,
        user: nil
      ),
      Coordenador.create!(
        departamento: nil,
        user: nil
      )
    ])
  end

  it "renders a list of coordenadors" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
