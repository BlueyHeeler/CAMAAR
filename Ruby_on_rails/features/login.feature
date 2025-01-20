Feature: Login
  As an user
  I want to log into the system
  So that I can access my account

    Background:
        Given There is an user with email "email@testes.com" and password "password123"

    Scenario: Login as PARTICIPANTE
        When I visit the login page
        And I fill in the "Email" field with "email@testes.com"
        And I fill in the "Senha" field with "password123"
        And I press "Entrar"
        Then I should go to the homepage
        And I should not see the "Gerenciamento" button


    Scenario: Login as ADMINISTRADOR
        When I visit the login page
        And I fill in the "Email" field with "email@testes.com"
        And I fill in the "Senha" field with "password123"
        And I press "Entrar"
        Then I should go to the homepage
        And Be able to see "Gerenciamento" button

    Scenario: Login invalid password
        When I visit the login page
        And I fill in the "Email" field with "email@testes.com"
        And I fill in the "Senha" field with "wrongpassword"
        And I press "Entrar"
        Then I should see the error message "Invalid email or password"
