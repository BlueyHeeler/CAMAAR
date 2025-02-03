require 'rails_helper'

RSpec.describe "respondidos/new", type: :view do
  before(:each) do
    assign(:respondido, Respondido.new(
      questionario: nil,
      user: nil
    ))
  end

  it "renders new respondido form" do
    render

    assert_select "form[action=?][method=?]", respondidos_path, "post" do

      assert_select "input[name=?]", "respondido[questionario_id]"

      assert_select "input[name=?]", "respondido[user_id]"
    end
  end
end
