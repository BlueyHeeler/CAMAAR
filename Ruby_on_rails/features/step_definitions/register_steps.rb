Given('I am on the registration page') do
    visit new_user_registration_path
  end

  When('I fill in the registration form with the following details:') do |table|
    data = table.hashes.first
    fill_in 'Name', with: data['Name']
    fill_in 'Email', with: data['Email']
    fill_in 'Password', with: data['Password']
    fill_in 'Password Confirmation', with: data['Password Confirmation']
  end

  When('I click the {string} button') do |button|
    click_button button
  end

  Then('I should see the message {string}') do |message|
    expect(page).to have_content(message)
  end

  Then('I should be redirected to the homepage') do
    expect(current_path).to eq(root_path)
  end

  Given('a user with the email {string} already exists') do |email|
    User.create!(
      name: 'Existing User',
      email: email,
      password: 'password123',
      password_confirmation: 'password123'
    )
  end

  Then('I should see the error message {string}') do |message|
    expect(page).to have_content(message)
  end
