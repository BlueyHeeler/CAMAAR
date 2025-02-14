require 'rails_helper'

RSpec.describe "questionarios/new", type: :view do
  before(:each) do
    assign(:questionario, Questionario.new(
      nome: "MyString",
      turma: nil,
      template: nil
    ))
  end

  it "renders new questionario form" do
    render

    assert_select "form[action=?][method=?]", questionarios_path, "post" do
      assert_select "input[name=?]", "questionario[nome]"

      assert_select "input[name=?]", "questionario[turma_id]"

      assert_select "input[name=?]", "questionario[template_id]"
    end
  end
end
