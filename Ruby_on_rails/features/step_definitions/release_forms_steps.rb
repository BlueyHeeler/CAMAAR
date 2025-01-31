Given('I successfully enter the homepage as an admin') do
    @admin = User.create!(
      email: 'admin@admin.com',
      password: 'password123',
      admin: true
    )
    
    visit login_path
    fill_in 'Email', with: 'admin@admin.com'
    fill_in 'Senha', with: 'password123'
    click_button 'Entrar'
  end
  
  Given('I managed to enter the gerenciamento_page') do
    click_button 'Gerenciamento'
    expect(current_path).to eq(gerenciamento_path)
  end
  
  Given('I successfully created some forms') do
    @template = Template.create!(
      name: 'Test Template',
      content: 'Test Content'
    )
  end
  
  When('I click the {string} button') do |button|
    click_button button
  end
  
  Then('I should be redirected to forms_page') do
    expect(current_path).to eq(forms_path)
  end
  
  Then('I want to be able to see the already created templates with no class associated') do
    expect(page).to have_content(@template.name)
    expect(page).to have_selector('.unassociated-template')
  end
  
  Then('I want to be able to select a specific class to send this form') do
    select 'Class A', from: 'class_selection'
  end
  
  Then('The the class will be associated with this form') do
    click_button 'Associate'
    expect(page).to have_content('Form successfully associated with class')
  end
  
  Then('Nothing happens') do
    expect(current_path).to eq(current_path)
  end
  
  Then('The association is not made') do
    click_button 'Associate'
    expect(page).to have_content('Failed to associate form with class')
  end