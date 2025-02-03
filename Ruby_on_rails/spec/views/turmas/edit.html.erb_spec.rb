require 'rails_helper'

RSpec.describe "turmas/edit", type: :view do
  let(:turma) {
    Turma.create!(
      codigo: "MyString",
      semestre: "MyString",
      materia: nil
    )
  }

  before(:each) do
    assign(:turma, turma)
  end

  it "renders the edit turma form" do
    render

    assert_select "form[action=?][method=?]", turma_path(turma), "post" do

      assert_select "input[name=?]", "turma[codigo]"

      assert_select "input[name=?]", "turma[semestre]"

      assert_select "input[name=?]", "turma[materia_id]"
    end
  end
end
