
Feature: Manage information
  In order to have a dishes represented by markers
  As an admin
  I want to add, edit and delete dishes, offers, encounters etc.

  Scenario: List Dishes
    Given I have dishes named Prawn Pomello, Char Grilled Chicken
    When I go to the list of dishes
    Then I should see Prawn Pomello
    And I should see Char Grilled Chicken

  Scenario: 
    Given I have codes 1:1:1:1:3:3:5:5, 1:1:1:1:2:4:5:5
    When I go to the list of codes
    Then I should see 1:1:1:1:3:3:5:5
    And I should see 1:1:1:1:2:4:5:5

  Scenario: 
    Given I am admin
    When I go to add a user
    Then the user should be included


