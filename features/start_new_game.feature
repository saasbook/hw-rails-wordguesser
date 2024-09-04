Feature: start new game

  As a player
  So I can play WordGuesser
  I want to start a new game

Scenario: I start a new game

  Given I am on the home page
  And I press "New Game"
  Then I should see "Guess a letter"

Scenario: I try to force a win

  Given I am on the winning page
  Then I should be on the show page
  And I should see "Guess a letter"
