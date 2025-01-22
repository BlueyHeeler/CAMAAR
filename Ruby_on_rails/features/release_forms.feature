Feature: Release Forms Admin
  As an admin user
  I want to log into the system
  And be able to release the created forms

    Background:
        Given I successfully enter the homepage as an admin
        And I managed to enter the gerenciamento_page
        And I successfully created some forms

    Scenario: Release forms
       When I click the "Enviar Formulários" button
       Then I should be redirected to forms_page
       Then I want to be able to see the already created templates with no class associated
       Then I want to be able to select a specific class to send this form
       Then The the class will be associated with this form

    Scenario: Release forms page not loading
        When I click the "Enviar Formulários" button
        Then Nothing happens

    Scenario: Release forms page not working properly
        When I click the "Enviar Formulários" button
       Then I should be redirected to forms_page
       Then I want to be able to see the already created templates with no class associated
       Then I want to be able to select a specific class to send this form
       Then The association is not made
