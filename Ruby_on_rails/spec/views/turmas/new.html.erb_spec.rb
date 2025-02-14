require 'rails_helper'

RSpec.describe "turmas/new", type: :view do
  before(:each) do
    assign(:turma, Turma.new(
      codigo: "MyString",
      semestre: "MyString",
      materia: nil
    ))
  end

  it "renders new turma form" do
    render

    assert_select "form[action=?][method=?]", turmas_path, "post" do
      assert_select "input[name=?]", "turma[codigo]"

      assert_select "input[name=?]", "turma[semestre]"

      assert_select "input[name=?]", "turma[materia_id]"
    end
  end
end
