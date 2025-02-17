Feature: Register
  As a visitor to the system
  I want to register
  So that I can access the system with my login

  Scenario: Successful registration with valid data
    Given I am on the registration page
    When I fill in the "matricula" with "123456"
    And I fill in the "Nome" with "Test"
    And I fill in the "Email" with "test@gmail.com"
    And I fill in the "Password" with "1234"
    And I select the user role for my registration "student"
    And I submit the form by clicking the "Sign Up →" button
    Then I should go to the login_path

  Scenario: Registration with an email already registered
    Given I am on the registration page
    When I fill in the "matricula" with "123456"
    And I fill in the "Nome" with "Test"
    And I fill in the "Email" with ""
    And I fill in the "Password" with "1234"
    And I select the user role for my registration "student"
    And I submit the form by clicking the "Sign Up →" button
    Then I should stay in the sign_up_path