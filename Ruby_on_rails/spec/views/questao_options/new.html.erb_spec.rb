require 'rails_helper'

RSpec.describe "questao_options/new", type: :view do
  before(:each) do
    assign(:questao_option, QuestaoOption.new(
      nome: "MyString",
      texto: "MyText",
      questao: nil
    ))
  end

  it "renders new questao_option form" do
    render

    assert_select "form[action=?][method=?]", questao_options_path, "post" do

      assert_select "input[name=?]", "questao_option[nome]"

      assert_select "textarea[name=?]", "questao_option[texto]"

      assert_select "input[name=?]", "questao_option[questao_id]"
    end
  end
end
