Feature: Homepage Admin
  As an admin user
  I want to log into the system
  And be able to manage some data

    Background:
        Given I successfully enter the homepage as an admin

    Scenario: Homepage as ADMIN
        When I click the "Gerenciamento" button
        Then I should be redirected to gerenciamento_page
        And be able to see and interact with "Importar Dados" button
        And be able to see and interact with "Editar Template" button
        And be able to see and interact with "Enviar Forms" button
        And be able to see and interact with "Resultados" button

    Scenario: Homepage as ADMIN not working properly
        When I as an admin can not see the "Gerenciamento" button
