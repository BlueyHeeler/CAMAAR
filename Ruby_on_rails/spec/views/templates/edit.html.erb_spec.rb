require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  let(:template) {
    Template.create!(
      nome: "MyString",
      publico_alvo: "MyString",
      semestre: "MyString"
    )
  }

  before(:each) do
    assign(:template, template)
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(template), "post" do

      assert_select "input[name=?]", "template[nome]"

      assert_select "input[name=?]", "template[publico_alvo]"

      assert_select "input[name=?]", "template[semestre]"
    end
  end
end
