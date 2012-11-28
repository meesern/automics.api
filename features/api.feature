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
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Rue's House
    And  I should get name: Christmas party
    And  I should get a SHA1 hash

  Scenario: I want a particular group 
    Given group Rue's House exists
    And   group Christmas party exists
    When I get endpoint /v1/group/94c32985a55fa443386754123c617eb3570d55b5
    Then Show me the Result
    And  I should get name: Christmas party

    #curl --noproxy localhost --request POST --data 'data={"name":"A wild night"}' http://localhost:3000/v1/group
  Scenario: I want a new group
    When I post endpoint /v1/group with data={"name":"A wild night"}
    Then Show me the Result
    Then response should have name: A wild night
    And  response should have a SHA1 hash

    #curl --noproxy localhost --request PUT --data 'data={"name":"A quiet night"}' http://localhost:3000/v1/group/94c32985a55fa443386754123c617eb3570d55b5
  Scenario: I change the name of a group
    Given group Rue's House exists
    And   group Christmas party exists
    When I post endpoint /v1/group/94c32985a55fa443386754123c617eb3570d55b5 with data={"name":"A quiet night"}
    And  I get endpoint /v1/group/94c32985a55fa443386754123c617eb3570d55b5
    Then I should get name: A quiet night

  Scenario: I delete (myself from) a group
    Then do later

  #
  # Organisations
  #
  Scenario: I list all organisations available to me
    Given organisation Alton Towers exists
    And organisation Nottingham Forest exists
    When I get endpoint /v1/organisation
    Then  Show me the Result
    And  I should get 3 results
    And  I should get name: Automics
    And  I should get id: 1
    And  I should get name: Alton Towers
    And  I should get name: Nottingham Forest

  Scenario: I view a particular organisation 
    Given organisation Alton Towers exists
    And   theme Christmas belongs to Automics
    When I get endpoint /v1/organisation/1
    Then  Show me the Result
    And  I should get name: Automics
    And  I should not get name: Alton Towers
    And  I should get id: 1
    And  I should get a list of themes 

  #
  # Themes
  #
  Scenario: I list all themes belonging to an organisation
    Given organisation Alton Towers exists
    And theme Christmas belongs to Automics
    And theme House Party belongs to Automics
    And theme Log Flume belongs to Alton Towers
    When I get endpoint /v1/organisation/1/theme
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Christmas
    And  I should get name: House Party
    And  I should not get name: Log Flume

  Scenario: I get a particular Theme 
    Given theme Christmas belongs to Automics
    And resource Santa Hat belongs to Christmas
    When I get endpoint /v1/theme/1
    Then  Show me the Result
    And   I should get name: Christmas
    And   I should get a list of resources 

  #
  # Resources
  #
  Scenario: I list all resources belonging to a theme
    Given theme Christmas belongs to Automics
    And resource Santa Hat belongs to Christmas
    And resource Snow belongs to Christmas
    When I get endpoint /v1/theme/1/resource
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Santa Hat
    And  I should get name: Snow

  Scenario: I get a particular Resource 
    Given theme Christmas belongs to Automics
    And resource Snow belongs to Christmas
    And resource Santa Hat belongs to Christmas
    When I get endpoint /v1/resource/1
    Then Show me the Result
    And  I should get name: Snow
    And  I should not get name: Santa Hat

