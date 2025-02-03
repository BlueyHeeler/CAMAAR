require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    assign(:user, User.create!(
      matricula: "Matricula",
      email: "Email",
      nome: "Nome",
      role: "Role",
      password_digest: "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Matricula/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Nome/)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(/Password Digest/)
  end
end
