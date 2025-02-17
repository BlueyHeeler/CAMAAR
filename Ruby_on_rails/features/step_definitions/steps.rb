Given('I successfully enter the homepage as an admin') do
    @admin = User.create!(
      matricula: 1111,
      email: 'email@testes.com',
      nome: 'Test User',
      role: 'admin',
      password: 'password',
      password_confirmation: 'password'
    )

    visit root_path
    fill_in 'matricula', with: @admin.matricula
    fill_in 'Password', with: 'password'
    choose 'admin'
    click_button 'Let`s go'
  end

  And('be able to see and interact with {string} button') do |button_name|
    case button_name
    when 'Importar dados'
      find('header').click_link('Importar dados')
    when 'Editar templates'
      find('header').click_link('Editar templates')
    when 'Enviar Formulários'
      find('header').click_link('Enviar Formulários')
    when 'Users'
      find('header').click_link('Users')
    when 'Resultados'
      find('header').click_link('Resultados')
    when 'Perfil'
      find('header').click_link('Perfil')
    when 'Logout'
      find('header').click_link('Logout')
    else
      raise "Button '#{button_name}' not found"
    end
  end

  When('I as an admin can not see the {string} button') do |button|
    case button
    when "Importar Dados"
      expect(page).not_to have_link(button)
    end
  end

  Given('I am an admin') do
    @admin = User.create!(
      matricula: 1111,
      email: 'email@testes.com',
      nome: 'Test User',
      role: 'admin',
      password: 'password',
      password_confirmation: 'password'
    )

    @departamento = Departamento.create!(
      nome: 'Test Department'
    )

    @coordenador = Coordenador.create!(
      user_id: @admin.id,
      departamento_id: @departamento.id
    )

    visit root_path
    fill_in 'matricula', with: @admin.matricula
    fill_in 'Password', with: 'password'
    choose 'admin'
    click_button 'Let`s go'
  end

  Given('I am on the template page') do
    visit home_gerenciamento_templates_path
  end

  When('I press {string}') do |button|
    click_on button
  end

  Then('I should go to the create template page') do
    expect(current_path).to eq(new_template_path)
  end

  Then('I should go to home_gerenciamento_templates_path') do
    expect(current_path).to eq(home_gerenciamento_templates_path)
  end

  When('I fill in the {string} field with {string}') do |field, value|
    fill_in field, with: value
  end

  Then('I should see the error message {string}') do |message|
    expect(page).to have_content(message)
  end

  Then('I should remain on the create template page') do
    expect(current_path).to eq(templates_path)
    expect(page).to have_current_path(templates_path)
  end

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

  And('I press the button {string}') do |button|
    click_button(button)
  end

  Then('I should go to the home_homepage_path') do
    expect(page).to have_current_path(home_homepage_path)
  end

  Given('I am a student and I got a questionario to do') do
    @student = User.create!(
      matricula: 1111,
      email: 'email@testes.com',
      nome: 'Test User',
      role: 'student',
      password: 'password',
      password_confirmation: 'password'
    )

    @departamento = Departamento.create!(
      nome: 'Test Department'
    )

    @materia = Materium.create!(
      nome: 'Test Subject',
      codigo: '1234',
      departamento_id: @departamento.id
    )

    @turma = Turma.create!(
      codigo: '1234',
      semestre: '2020.1',
      materium_id: @materia.id
    )

    @template = Template.create!(
      nome: 'Test Template',
      publico_alvo: 'Test Audience',
      semestre: '2020.1'
    )

    @matricula = Matricula.create!(
      user_id: @student.id,
      turma_id: @turma.id
    )

    @questionario = Questionario.create!(
      nome: 'Test Questionnaire',
      turma_id: @turma.id,
      template_id: @template.id,
      user_id: @student.id
    )

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

  Given('I managed to go to home_gerenciamento_enviar_templates_path') do
    visit home_gerenciamento_enviar_templates_path
  end

  Given('I already created some templates') do
    @template = Template.create!(
      nome: 'Test Template',
      publico_alvo: 'Test Audience',
      semestre: '2020.1'
    )

    @departamento = Departamento.create!(
      nome: 'Test Department'
    )

    @materia = Materium.create!(
      nome: 'Test Subject',
      codigo: '1234',
      departamento_id: @departamento.id
    )

    @turma = Turma.create!(
      codigo: '1234',
      semestre: '2020.1',
      materium_id: @materia.id
    )
  end

  Then('I want to be able to see the already created templates') do
    expect(page).to have_content(@template.nome)
  end

  Then('I should be in the new_questionario_path') do
    expect(current_path).to eq(new_questionario_path)
  end

  Then('I should see the turma in the dropdown') do
    expect(page).to have_select('questionario_turma_id')
  end

  When('I fill in the Nome field with {string}') do |value|
    fill_in 'questionario_nome', with: value
  end

  And('I select the turma {string}') do |turma_name|
    codigo, nome = turma_name.split('-')
    formatted_option = "#{codigo.strip} - #{nome.strip}"

    turma = Turma.joins(:materium)
               .where(codigo: codigo.strip)
               .where(materia: { nome: nome.strip })
               .first

    find("select#questionario_turma_id").find("option[value='#{turma.id}']").select_option
  end

  Then ('I should go to questionario_path') do
    expect(current_path).to eq(questionario_path(Questionario.last))
  end

  Given('I am on the registration page') do
    visit signup_path
  end

  When('I fill in the {string} with {string}') do |field, value|
    fill_in field, with: value
  end

  And('I click the {string} button') do |button_text|
    click_on button_text
  end

  And('I select the user role for my registration {string}') do |role|
    choose("role_#{role}")
  end

  Given('I am on the sign_up_path') do
    visit signup_path
  end


  And('I submit the form by clicking the {string} button') do |button_text|
    click_button button_text
  end

  Then('I should go to the login_path') do
    expect(current_path).to eq(login_path)
  end

  Then('I should stay in the sign_up_path') do
    expect(current_path).to eq(signup_path)
  end
