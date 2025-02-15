Feature: HomePage student
  As a student
  I want to see my homepage
  So that I can evaluate my courses
  And edit my profile account

    Background:
        Given I am a student and I got a questionario to do

    Scenario: Managing my profile account as student
        When I visit the homepage as a student
        Then I want to be able to enter my profile page by clicking in my perfil
        Then I want to be redirected to user page
        Then I should be able to see information about my user
        
    Scenario: Viewing available questionnaires as student
        When I visit the homepage as a student
        Then I should see my profile section
        And I should see available questionnaires in cards
        When I select a questionnaire
        Then I should be able to answer it
