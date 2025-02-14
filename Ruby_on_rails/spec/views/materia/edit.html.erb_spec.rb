require 'rails_helper'

RSpec.describe "materia/edit", type: :view do
  let(:materium) {
    Materium.create!(
      nome: "MyString",
      codigo: "MyString",
      departamento: nil
    )
  }

  before(:each) do
    assign(:materium, materium)
  end

  it "renders the edit materium form" do
    render

    assert_select "form[action=?][method=?]", materium_path(materium), "post" do
      assert_select "input[name=?]", "materium[nome]"

      assert_select "input[name=?]", "materium[codigo]"

      assert_select "input[name=?]", "materium[departamento_id]"
    end
  end
end
