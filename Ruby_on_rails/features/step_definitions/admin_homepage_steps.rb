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

  When('I click the {string} button') do |button|
    click_button button
  end

  Then('I should be redirected to gerenciamento_page') do
    expect(current_path).to eq(gerenciamento_path)
  end

  Then('be able to see and interact with {string} button') do |button|
    expect(page).to have_button(button)
    expect(page).to have_selector("button[disabled='false']", text: button)
  end

  When('I as an admin can not see the {string} button') do |button|
    expect(page).not_to have_button(button)
  end
