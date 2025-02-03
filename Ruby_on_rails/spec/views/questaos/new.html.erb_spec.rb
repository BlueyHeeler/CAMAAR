require 'rails_helper'

RSpec.describe "questaos/new", type: :view do
  before(:each) do
    assign(:questao, Questao.new(
      nome: "MyString",
      texto: "MyText",
      tipo: "MyString",
      template: nil
    ))
  end

  it "renders new questao form" do
    render

    assert_select "form[action=?][method=?]", questaos_path, "post" do

      assert_select "input[name=?]", "questao[nome]"

      assert_select "textarea[name=?]", "questao[texto]"

      assert_select "input[name=?]", "questao[tipo]"

      assert_select "input[name=?]", "questao[template_id]"
    end
  end
end
