Feature: Create Template
    As a admin
    I want to create a template
    So that I can better manage the models

    Background:
        Given I am an admin
        Given I am on the template page

    Scenario: Create template
        When I press "New Template"
        Then I should go to the create template page
        When I fill in the "Nome" field with "Nome do Template"
        When I fill in the "Publico alvo" field with "student"
        When I fill in the "Semestre" field with "2024.2"
        And I press "Create Template"
        Then I should go to home_gerenciamento_templates_path

    Scenario: Create template with missing fields
        When I press "New Template"
        Then I should go to the create template page
        When I fill in the "Nome" field with "Nome do Template"
        When I fill in the "Publico alvo" field with "student"
        When I fill in the "Semestre" field with ""
        When I press "Create Template"
        Then I should see the error message "Semestre can't be blank"
        And I should remain on the create template page

