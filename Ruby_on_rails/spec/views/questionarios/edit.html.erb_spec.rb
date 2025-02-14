require 'rails_helper'

RSpec.describe "questionarios/edit", type: :view do
  let(:questionario) {
    Questionario.create!(
      nome: "MyString",
      turma: nil,
      template: nil
    )
  }

  before(:each) do
    assign(:questionario, questionario)
  end

  it "renders the edit questionario form" do
    render

    assert_select "form[action=?][method=?]", questionario_path(questionario), "post" do
      assert_select "input[name=?]", "questionario[nome]"

      assert_select "input[name=?]", "questionario[turma_id]"

      assert_select "input[name=?]", "questionario[template_id]"
    end
  end
end
