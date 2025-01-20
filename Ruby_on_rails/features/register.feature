Feature: Register
  As a visitor to the system
  I want to register
  So that I can access the system with my login

  Scenario: Successful registration with valid data
    Given I am on the registration page
    When I fill in the registration form with the following details:
      | Name         | Email                  | Password    | Password Confirmation |
      | fulano       | fulano@email.com       | password123 | password123           |
    And I click the "Register" button
    Then I should see the message "Registration successful!"
    And I should be redirected to the homepage

  Scenario: Registration with an email already registered
    Given a user with the email "fulano@email.com" already exists
    And I am on the registration page
    When I fill in the registration form with the following details:
        | Name         | Email                  | Password    | Password Confirmation |
        | fulano       | fulano@email.com       | password123 | password123           |
    And I click the "Register" button
    Then I should see the error message "Email is already taken"