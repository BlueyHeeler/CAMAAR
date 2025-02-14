require 'rails_helper'

RSpec.describe "departamentos/new", type: :view do
  before(:each) do
    assign(:departamento, Departamento.new(
      nome: "MyString"
    ))
  end

  it "renders new departamento form" do
    render

    assert_select "form[action=?][method=?]", departamentos_path, "post" do
      assert_select "input[name=?]", "departamento[nome]"
    end
  end
end
