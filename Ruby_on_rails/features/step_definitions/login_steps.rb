Given('There is an {string} user with matricula {string} and password {string}') do |role, matricula, password|
  User.create!(
    matricula: matricula,
    email: 'email@testes.com',
    nome: 'Test User',
    role: role,
    password: password,
    password_confirmation: password
  )
end

When('I visit the login page') do
  visit login_path
end

When('I fill in the matricula field with {string}') do |value|
  fill_in 'matricula', with: value
end

When('I fill in the Password field with {string}') do |value|
  fill_in 'Password', with: value
end

When('I select the user role {string}') do |role|
  choose("user_role_#{role}")
end

When('I press the login button {string}') do |button|
  click_button(button)
end

Then('I should go to the homepage') do
  expect(page).to have_current_path(home_homepage_path)
end

Then('I should not see the {string} button') do |button|
  expect(page).not_to have_button(button)
end

Then('I should see the error message {string}') do |message|
  expect(page).to have_content(message)
end
