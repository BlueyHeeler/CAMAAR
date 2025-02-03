require 'rails_helper'

RSpec.describe "coordenadors/show", type: :view do
  before(:each) do
    assign(:coordenador, Coordenador.create!(
      departamento: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
