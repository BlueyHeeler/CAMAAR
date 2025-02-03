require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!(
      matricula: "MyString",
      email: "MyString",
      nome: "MyString",
      role: "MyString",
      password_digest: "MyString"
    )
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do

      assert_select "input[name=?]", "user[matricula]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[nome]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[password_digest]"
    end
  end
end
