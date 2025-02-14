require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      nome: "MyString",
      publico_alvo: "MyString",
      semestre: "MyString"
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do
      assert_select "input[name=?]", "template[nome]"

      assert_select "input[name=?]", "template[publico_alvo]"

      assert_select "input[name=?]", "template[semestre]"
    end
  end
end
