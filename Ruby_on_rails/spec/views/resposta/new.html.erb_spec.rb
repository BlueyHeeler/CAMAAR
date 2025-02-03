require 'rails_helper'

RSpec.describe "resposta/new", type: :view do
  before(:each) do
    assign(:respostum, Respostum.new(
      valor: "MyString",
      questao: nil,
      questionario: nil
    ))
  end

  it "renders new respostum form" do
    render

    assert_select "form[action=?][method=?]", resposta_path, "post" do

      assert_select "input[name=?]", "respostum[valor]"

      assert_select "input[name=?]", "respostum[questao_id]"

      assert_select "input[name=?]", "respostum[questionario_id]"
    end
  end
end
