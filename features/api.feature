Feature: Provide API
  In order to have information usable by a mobile app
  As a mobile phone
  I want to retrieve (and submit) information
  
  #Note that because this documents an API, features include url's that would 
  #not normally be appropriate for a cucumber feature specification

  Background: It's Christmas
    Given organisation Automics exists
    And   theme Christmas exists

  Scenario: I list all groups available to me
    Given group Rue's House exists
    And   group Christmas party exists
    When I get endpoint /group
    Then I should get 2 results
    And  I should get name: Rue's House
    And  I should get name: Christmas party
    And  I should get a sha1 hash

#  Scenario: Get food mapped to a code
#    When I request the code 
#    Then I should see Prawn Pomello
#    And I should get url1: http://www.somewhere
#    And I should get url2: http://www.somewhere-else
#
#  Scenario: Get an offer mapped to a code
#    Given I have mapped 1:1:1:1:2:3:5:6 to the special offer 10% off
#    When I request /v1/1:1:1:1:2:3:5:6
#    Then I should see 10% off
#    And I should get type: offer
#
#  Scenario: Get the name for a code
#    When I request /v1/1:1:1:1:3:3:5:5/name
#    Then I should see Prawn Pomello
#
#  Scenario: Get the thumbnail for a code
#    When I request /v1/1:1:1:1:3:3:5:5/thumb
#    Then I should get a picture
#
#  Scenario: Get the image for a code
#    When I request /v1/1:1:1:1:3:3:5:5/image
#    Then I should get a picture
#
#  Scenario: Get the url1 for a code
#    When I request /v1/1:1:1:1:3:3:5:5/url1
#    Then I should get a url
#
#  Scenario: Get the personal code
#    Given bob is registered
#    When I request /v1/1:1:1:1:3:3:5:5/person/bob
#    Then I should see Prawn Pomello
#    And  I should get type: food
#    And  I should see bob
#
#  Scenario: Get the personal code
#    Given bob is registered
#    And   bob has encountered Prawn Pomello
#    When I request /v1/1:1:1:1:3:3:5:5/person/bob
#    Then I should see Prawn Pomello
#    And  I should get type: food
#    And  I should get the date
#    And  I should get the rating
#    And  I should get the comment
#
#  Scenario: Get information about the person
#    Given bob is registered
#    And   his favourites are: Pandan Chicken, Char Grilled Duck
#    And   he has been offered 10% off
#    When I request /v1/person/bob
#    Then I should get name: bob
#    And  I should see 10% off
#    And  I should see Pandan Chicken
#    And  I should see Char Grilled Duck
#
#  Scenario: Get information about the person's eating history
#    Given bob is registered
#    And   bob has encountered Prawn Pomello
#    And   bob has encountered Chilli Chicken
#    When I request /v1/person/bob
#    And  I should see Prawn Pomello
#    And  I should see Chilli Chicken
#
#  Scenario: Get information about a dish
#    When I request /v1/dish/Prawn%20Pomello
#    Then I should get the urls
#
#  Scenario: Get information about a dish thumbnail
#    When I request /v1/dish/Prawn%20Pomello/thumb
#    Then I should get a picture
#
#  Scenario: Get information about a dish image
#    When I request /v1/dish/Prawn%20Pomello/image
#    Then I should get a picture
#
#  Scenario: Get information about the relation between a person and dish
#    Given bob is registered
#    And   bob has encountered Prawn Pomello
#    When I request /v1/dish/Prawn%20Pomello/person/bob
#    Then I should get the comment
#    And  I should get the rating
#    And  I should get the date
#
