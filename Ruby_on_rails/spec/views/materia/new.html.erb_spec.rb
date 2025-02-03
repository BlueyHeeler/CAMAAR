require 'rails_helper'

RSpec.describe "materia/new", type: :view do
  before(:each) do
    assign(:materium, Materium.new(
      nome: "MyString",
      codigo: "MyString",
      departamento: nil
    ))
  end

  it "renders new materium form" do
    render

    assert_select "form[action=?][method=?]", materia_path, "post" do

      assert_select "input[name=?]", "materium[nome]"

      assert_select "input[name=?]", "materium[codigo]"

      assert_select "input[name=?]", "materium[departamento_id]"
    end
  end
end
