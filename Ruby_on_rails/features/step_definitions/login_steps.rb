Given('There is an user with email {string} and password {string}') do |email, password|
    @user = User.create!(
      email: email,
      password: password
    )
  end
  
  When('I visit the login page') do
    visit login_path
  end
  
  When('I fill in the {string} field with {string}') do |field, value|
    fill_in field, with: value
  end
  
  When('I press {string}') do |button|
    click_button button
  end
  
  Then('I should go to the homepage') do
    expect(current_path).to eq(root_path)
  end
  
  Then('I should not see the {string} button') do |button|
    expect(page).not_to have_button(button)
  end
  
  Then('Be able to see {string} button') do |button|
    expect(page).to have_button(button)
  end
  
  Then('I should see the error message {string}') do |message|
    expect(page).to have_content(message)
  end