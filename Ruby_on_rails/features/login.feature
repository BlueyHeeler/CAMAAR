Feature: Login
  As an user
  I want to log into the system
  So that I can access my account

    Background:
        Given There is an "student" user with matricula "141128" and password "password123"

    Scenario: Login as PARTICIPANTE
        When I visit the login page
        And I fill in the matricula field with "141128"
        And I fill in the Password field with "password123"
        And I select the user role "student"
        And I press the login button "Entrar"
        Then I should go to the homepage
        And I should not see the "Gerenciamento" button

    Scenario: Login invalid password
        When I visit the login page
        And I fill in the "matricula" field with "141128"
        And I fill in the "Password" field with "wrongpassword"
        And I select the user role "student"
        And I press the login button "Entrar"
        Then I should see the error message "Invalid email or password"