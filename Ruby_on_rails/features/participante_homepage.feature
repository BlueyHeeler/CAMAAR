Feature: HomePage Participante
  As a user
  I want to see my homepage
  So that I can evaluate my courses
  And edit my profile account

    Background:
        Given I am a PARTICIPANTE

    Scenario: HomePage as PARTICIPANTE
        When I am on the homepage as a PARTICIPANTE
        Then I want to visit my profile page
        And add/change my profile picture
        
    Scenario: HomePage as PARTICIPANTE
        When I am on the homepage as a PARTICIPANTE
        Then I want to select a specific course
        And answer the form to rate the course
        Then I submit it