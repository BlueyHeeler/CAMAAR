Feature: Release Forms Admin
  As an admin user
  I want to log into the system
  And be able to release the created forms

    Background:
        Given I successfully enter the homepage as an admin
        Given I already created some templates
        And I managed to go to home_gerenciamento_enviar_templates_path
        And I already created some templates

    Scenario: Release forms
        Then I want to be able to see the already created templates
        When I press "Criar Questionário"
        Then I should be in the new_questionario_path
        When I fill in the Nome field with "Avaliação de matéria"
        And I select the turma "1234-Test Subject"
        And I press "Criar"
        Then I should go to questionario_path