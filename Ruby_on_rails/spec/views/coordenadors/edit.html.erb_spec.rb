require 'rails_helper'

RSpec.describe "coordenadors/edit", type: :view do
  let(:coordenador) {
    Coordenador.create!(
      departamento: nil,
      user: nil
    )
  }

  before(:each) do
    assign(:coordenador, coordenador)
  end

  it "renders the edit coordenador form" do
    render

    assert_select "form[action=?][method=?]", coordenador_path(coordenador), "post" do

      assert_select "input[name=?]", "coordenador[departamento_id]"

      assert_select "input[name=?]", "coordenador[user_id]"
    end
  end
end
