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
    When I get endpoint /v1/group
    Then I should get 2 results
    And  I should get name: Rue's House
    And  I should get name: Christmas party
    And  I should get a SHA1 hash
    And  Show me the Result

  Scenario: I want a particular group 
    Given group Rue's House exists
    And   group Christmas party exists
    When I get endpoint /v1/group/94c32985a55fa443386754123c617eb3570d55b5
    Then I should get name: Christmas party
    And  Show me the Result

    #curl --noproxy localhost --request POST --data 'data={"name":"A wild night"}' http://localhost:3000/v1/group
  Scenario: I want a new group
    When I post endpoint /v1/group with data={"name":"A wild night"}
    Then response should have name: A wild night
    And  response should have a SHA1 hash
    And  Show me the Result

