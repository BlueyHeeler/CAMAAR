require 'rails_helper'

RSpec.describe "resposta/edit", type: :view do
  let(:respostum) {
    Respostum.create!(
      valor: "MyString",
      questao: nil,
      questionario: nil
    )
  }

  before(:each) do
    assign(:respostum, respostum)
  end

  it "renders the edit respostum form" do
    render

    assert_select "form[action=?][method=?]", respostum_path(respostum), "post" do

      assert_select "input[name=?]", "respostum[valor]"

      assert_select "input[name=?]", "respostum[questao_id]"

      assert_select "input[name=?]", "respostum[questionario_id]"
    end
  end
end
