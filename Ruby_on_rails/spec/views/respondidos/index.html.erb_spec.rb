require 'rails_helper'

RSpec.describe "respondidos/index", type: :view do
  before(:each) do
    assign(:respondidos, [
      Respondido.create!(
        questionario: nil,
        user: nil
      ),
      Respondido.create!(
        questionario: nil,
        user: nil
      )
    ])
  end

  it "renders a list of respondidos" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
