require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      matricula: "MyString",
      email: "MyString",
      nome: "MyString",
      role: "MyString",
      password_digest: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[matricula]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[nome]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[password_digest]"
    end
  end
end
