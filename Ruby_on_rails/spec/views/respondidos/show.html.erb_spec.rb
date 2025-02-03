require 'rails_helper'

RSpec.describe "respondidos/show", type: :view do
  before(:each) do
    assign(:respondido, Respondido.create!(
      questionario: nil,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
