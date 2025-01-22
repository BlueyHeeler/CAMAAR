Feature: Templates Admin
  As an admin user
  I want to log into the system
  And be able manage the forms templates

    Background:
        Given I successfully enter the homepage as an admin
        And I managed to enter the gerenciamento_page

    Scenario: Templates working
        When I click the "Editar Template" button
        Then I should be redirected to template_page
        Then I want to be able to see the already created templates or create a new template
        When I click on the "Criar Template" button
        Then I should see a stackable form.
        And I want to edit the questions.
        Then Submit it

    Scenario: Template page not loading
        When I click the "Editar Template" button
        Then Nothing happens

    Scenario: Templates not working properly
        When I click the "Editar Template" button
        Then I should be redirected to template_page
        Then I want to be able to see the already created templates or create a new template
        When I click on the "Criar Template" button
        Then Nothing happens
