Given('I am a student and I got a questionario to do') do
  # First create the student user
  @student = User.create!(
    matricula: 1111,
    email: 'email@testes.com',
    nome: 'Test User',
    role: 'student',
    password: 'password',
    password_confirmation: 'password'
  )

  # Create department
  @departamento = Departamento.create!(
    nome: 'Test Department'
  )

  # Create subject (materia) with department reference
  @materia = Materium.create!(
    nome: 'Test Subject',
    codigo: '1234',
    departamento_id: @departamento.id
  )

  # Create class (turma) with subject reference
  @turma = Turma.create!(
    codigo: '1234',
    semestre: '2020.1',
    materium_id: @materia.id
  )

  # Create template first before questionario
  @template = Template.create!(
    nome: 'Test Template',
    publico_alvo: 'Test Audience',
    semestre: '2020.1'
  )

  # Create matricula (enrollment) with user and class references - Fixed user_id
  @matricula = Matricula.create!(
    user_id: @student.id,        # Changed from @student to @student.id
    turma_id: @turma.id
  )

  # Finally create questionario with class and template references
  @questionario = Questionario.create!(
    nome: 'Test Questionnaire',
    turma_id: @turma.id,
    template_id: @template.id,
    user_id: @student.id
  )
  
  # Log in the student
  visit login_path
  fill_in 'matricula', with: @student.matricula
  fill_in 'Password', with: 'password'
  click_button 'Let`s go'
end

When('I visit the homepage as a student') do
  visit home_homepage_path
end

Then('I want to be able to enter my profile page by clicking in my perfil') do
  find('header').click_link('Perfil')
end

Then('I should be able to see information about my user') do
  expect(page).to have_content('Test User')
end

Then('I want to be redirected to user page') do
  expect(current_path).to eq(user_path(@student))
end

Then('Be able to change my profile picture') do
  attach_file('user[avatar]', 'spec/fixtures/test_avatar.jpg')
  click_button 'Update'
end

Then('I should see my profile section') do
  expect(page).to have_css('.profile-section')
end

Then('I should see available questionnaires in cards') do
  expect(page).to have_css('.cards-section')
end

When('I select a questionnaire') do
  visit new_respostum_path(questionario_id: @questionario.id)
end

Then('I should be able to answer it') do
  expect(page).to have_css('form')
end
