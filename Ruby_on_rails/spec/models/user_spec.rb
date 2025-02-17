require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(nome: "User Test", matricula: "1234", email: "user@test.com", password: "password", password_confirmation: "password", role: "student")
    expect(user).to be_valid
  end

  it "is not valid without a password" do
    user = User.new(nome: "User Test", matricula: "1234", email: "user@test.com", role: "student")
    expect(user).to_not be_valid
  end

  it "is not valid without a role" do
    user = User.new(nome: "User Test", matricula: "1234", email: "user@test.com", password: "password")
    expect(user).to_not be_valid
  end

  it "is not valid with an invalid role" do
    user = User.new(nome: "User Test", matricula: "1234", email: "user@test.com", password: "password", role: "invalid_role")
    expect(user).to_not be_valid
  end

  it "can update the role" do
    user = User.create(nome: "User Test", matricula: "1234", email: "user@test.com", password: "password", role: "student")
    user.update_role("admin")
    expect(user.role).to eq("admin")
  end
end
