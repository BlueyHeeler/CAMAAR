Given('I am a PARTICIPANTE') do
    @participant = User.create!(
      email: 'participant@test.com',
      password: 'password123',
      admin: false
    )

    visit login_path
    fill_in 'Email', with: 'participant@test.com'
    fill_in 'Senha', with: 'password123'
    click_button 'Entrar'
  end

  When('I visit the homepage as a PARTICIPANTE') do
    visit root_path
  end

  Then('I want to be able to enter my profile page by clicking in my perfil avatar') do
    click_link 'profile-avatar'
  end

  Then('I want to be redirected to user_update page') do
    expect(current_path).to eq(edit_user_path(@participant))
  end

  Then('Be able to change my profile picture') do
    attach_file('user[avatar]', 'spec/fixtures/test_avatar.jpg')
    click_button 'Update'
  end

  Then('I want to be able to select a specific course') do
    expect(page).to have_selector('.course-card')
    first('.course-card').click
  end

  Then('Answer the form to rate it') do
    expect(page).to have_selector('form.rating-form')
    fill_in 'Rating', with: '5'
    fill_in 'Comment', with: 'Great course!'
  end

  Then('I want to be able to submit it') do
    click_button 'Submit Rating'
    expect(page).to have_content('Rating submitted successfully')
  end
