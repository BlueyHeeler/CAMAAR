require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        matricula: "Matricula",
        email: "Email",
        nome: "Nome",
        role: "Role",
        password_digest: "Password Digest"
      ),
      User.create!(
        matricula: "Matricula",
        email: "Email",
        nome: "Nome",
        role: "Role",
        password_digest: "Password Digest"
      )
    ])
  end

  it "renders a list of users" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Matricula".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Nome".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Role".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Password Digest".to_s), count: 2
  end
end
