require 'rails_helper'

RSpec.describe "questao_options/edit", type: :view do
  let(:questao_option) {
    QuestaoOption.create!(
      nome: "MyString",
      texto: "MyText",
      questao: nil
    )
  }

  before(:each) do
    assign(:questao_option, questao_option)
  end

  it "renders the edit questao_option form" do
    render

    assert_select "form[action=?][method=?]", questao_option_path(questao_option), "post" do

      assert_select "input[name=?]", "questao_option[nome]"

      assert_select "textarea[name=?]", "questao_option[texto]"

      assert_select "input[name=?]", "questao_option[questao_id]"
    end
  end
end
