require 'rails_helper'

RSpec.describe "questaos/edit", type: :view do
  let(:questao) {
    Questao.create!(
      nome: "MyString",
      texto: "MyText",
      tipo: "MyString",
      template: nil
    )
  }

  before(:each) do
    assign(:questao, questao)
  end

  it "renders the edit questao form" do
    render

    assert_select "form[action=?][method=?]", questao_path(questao), "post" do

      assert_select "input[name=?]", "questao[nome]"

      assert_select "textarea[name=?]", "questao[texto]"

      assert_select "input[name=?]", "questao[tipo]"

      assert_select "input[name=?]", "questao[template_id]"
    end
  end
end
