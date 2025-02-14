require 'rails_helper'

RSpec.describe "coordenadors/new", type: :view do
  before(:each) do
    assign(:coordenador, Coordenador.new(
      departamento: nil,
      user: nil
    ))
  end

  it "renders new coordenador form" do
    render

    assert_select "form[action=?][method=?]", coordenadors_path, "post" do
      assert_select "input[name=?]", "coordenador[departamento_id]"

      assert_select "input[name=?]", "coordenador[user_id]"
    end
  end
end
