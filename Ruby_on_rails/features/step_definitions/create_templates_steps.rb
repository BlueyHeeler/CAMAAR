Given('I am on the template page') do
    visit templates_path
  end
  
  When('I press {string}') do |button|
    click_button button
  end
  
  Then('I should go to the create template page') do
    expect(current_path).to eq(new_template_path)
  end
  
  When('I fill in the {string} field with {string}') do |field, value|
    fill_in field, with: value
  end
  
  Then('I should go to the template page') do
    expect(current_path).to eq(templates_path)
  end
  
  Then('I should see {string}') do |content|
    expect(page).to have_content(content)
  end
  
  Then('I should see the error message {string}') do |message|
    expect(page).to have_content(message)
  end
  
  Then('I should remain on the create template page') do
    expect(current_path).to eq(templates_path)
    expect(page).to have_current_path(templates_path)
  end