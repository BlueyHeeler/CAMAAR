require 'rails_helper'

RSpec.describe "respondidos/edit", type: :view do
  let(:respondido) {
    Respondido.create!(
      questionario: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:respondido, respondido)
  end

  it "renders the edit respondido form" do
    render

    assert_select "form[action=?][method=?]", respondido_path(respondido), "post" do
      assert_select "input[name=?]", "respondido[questionario_id]"

      assert_select "input[name=?]", "respondido[user_id]"
    end
  end
end
