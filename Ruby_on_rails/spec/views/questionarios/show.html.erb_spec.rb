require 'rails_helper'

RSpec.describe "questionarios/show", type: :view do
  before(:each) do
    assign(:questionario, Questionario.create!(
      nome: "Nome",
      turma: nil,
      template: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
