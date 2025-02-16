Feature: Homepage Admin
  As an admin user
  I want to log into the system
  And be able to manage some data

    Background:
        Given I successfully enter the homepage as an admin

    Scenario: Homepage as ADMIN
        And be able to see and interact with "Importar dados" button
        And be able to see and interact with "Editar templates" button
        And be able to see and interact with "Enviar Formulários" button
        And be able to see and interact with "Users" button
        And be able to see and interact with "Resultados" button
        And be able to see and interact with "Perfil" button
        And be able to see and interact with "Logout" button

    Scenario: Homepage as ADMIN not working properly
        When I as an admin can not see the "Importar Dados" button
