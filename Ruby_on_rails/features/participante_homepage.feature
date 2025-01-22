Feature: HomePage Participante
  As a user
  I want to see my homepage
  So that I can evaluate my courses
  And edit my profile account

    Background:
        Given I am a PARTICIPANTE

    Scenario: HomePage as PARTICIPANTE
        When I visit the homepage as a PARTICIPANTE
        Then I want to be able to enter my profile page by clicking in my perfil avatar
        Then I want to be redirected to user_update page
        And Be able to change my profile picture
        
    Scenario: HomePage as PARTICIPANTE
        When I visit the homepage as a PARTICIPANTE
        Then I want to be able to select a specific course
        And Answer the form to rate it
        Then I want to be able to submit it
