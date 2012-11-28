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
    Given group Jonty's House exists
    And   group Christmas party exists
    When I get endpoint /v1/group
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Jonty's House
    And  I should get name: Christmas party
    And  I should get a SHA1 hash

  Scenario: I want a particular group 
    Given group Jonty's House exists
    And   group Christmas party exists
    When I get endpoint /v1/group/94c32985a55fa443386754123c617eb3570d55b5
    Then Show me the Result
    And  I should get name: Christmas party

    #curl --noproxy localhost --request POST --data 'data={"name":"Jonty's Groove"}' http://localhost:3000/v1/group
  Scenario: I want a new group
    When I post endpoint /v1/group with data={"name":"Jonty's Groove"}
    Then Show me the Result
    Then response should have name: Jonty's Groove
    And  response should have a SHA1 hash

    #curl --noproxy localhost --request PUT --data 'data={"name":"A quiet night"}' http://localhost:3000/v1/group/94c32985a55fa443386754123c617eb3570d55b5
  Scenario: I change the name of a group
    Given group Jonty's House exists
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

  #
  # Photo
  #
  Scenario: I list all photos available to me
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to Jonty's House
    And   photo Liz belongs to Jonty's House
    When I get endpoint /v1/photo
    Then Show me the Result
    And  I should get 2 results
    And  I should get description: Rich and Mel
    And  I should get description: Liz

  Scenario: I want a particular photo 
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to Jonty's House
    When I get endpoint /v1/photo/1
    Then Show me the Result
    And  I should get description: Rich and Mel

    #curl --noproxy localhost --request POST --data 'data={"description":"Look at 'em go!"}' http://localhost:3000/v1/photo
  Scenario: I share a new photo
    When I post endpoint /v1/photo with data={"description":"Look at 'em go!"}
    Then do later

    #curl --noproxy localhost --request PUT --data 'data={"description":"Rich, Liz and Mel"}' http://localhost:3000/v1/photo/1
  Scenario: I change the description of a photo
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to Jonty's House
    When I post endpoint /v1/photo/1 with data={"description":"Rich, Liz and Mel"}
    And  I get endpoint /v1/photo/1
    Then I should get description: Rich, Liz and Mel

    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/photo/1
  Scenario: I delete a photo
    Given group Jonty's House exists
    And   photo Liz belongs to Jonty's House
    And   photo Rich and Mel belongs to Jonty's House
    When I delete endpoint /v1/photo/1 
    And  I get endpoint /v1/photo
    Then I should get 1 result
    And  I should get description: Rich and Mel
    And  I should not get description: Liz

  #
  # Comic
  #
  Scenario: I list all comics available to me
    Given comic Liz fills the Stockings exists
    And   comic Mel's Bells exists
    When I get endpoint /v1/comic
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Liz fills the Stockings
    And  I should get name: Mel's Bells

  Scenario: I want a particular comic 
    Given comic Mel's Bells exists
    When I get endpoint /v1/comic/1
    Then Show me the Result
    And  I should get name: Mel's Bells

    #curl --noproxy localhost --request POST --data 'data={"name":"Santa Rich", "description":"Like a ferret up a stove pipe"}' http://localhost:3000/v1/comic
  Scenario: I make a new comic
    When I post endpoint /v1/comic with data={"name":"Santa Rich", "description":"Like a ferret up a stove pipe."}
    Then Show me the Response
    And  response should have name: Santa Rich
    And  response should have description: Like a ferret up a stove pipe.
    
    #curl --noproxy localhost --request PUT --data 'data={"name":"Mel's Christmas Bells"}' http://localhost:3000/v1/comic/1
  Scenario: I change the name of a comic
    Given comic Mel's Bells exists
    When I post endpoint /v1/comic/1 with data={"name":"Mel's Christmas Bells"}
    And  I get endpoint /v1/comic/1
    Then I should get name: Mel's Christmas Bells

    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/comic/1
  Scenario: I delete a comic
    Given comic Liz fills the Stockings exists
    And   comic Mel's Bells exists
    When I delete endpoint /v1/comic/1 
    And  I get endpoint /v1/comic
    Then I should get 1 result
    And  I should get name: Mel's Bells
    And  I should not get name: Liz fills the Stockings

  #
  # Panel
  #
  Scenario: I list all panels in my comic
    Given comic Santa Rich exists
    And   comic Mel's Bells exists
    And   panel 1 belongs to Santa Rich
    And   panel 2 belongs to Santa Rich
    And   panel 3 belongs to Mel's Bells
    And   panel 4 belongs to Santa Rich
    When I get endpoint /v1/comic/1/panel
    Then Show me the Result
    And  I should get 3 results
    And  I should get id: 1
    And  I should get id: 2
    And  I should not get id: 3
    And  I should get id: 4

  Scenario: I want a particular panel 
    Given comic Mel's Bells exists
    And   panel 1 belongs to Mel's Bells
    When I get endpoint /v1/panel/1
    Then  I should get id: 1
    
    #curl --noproxy localhost --request POST --data 'data={}' http://localhost:3000/v1/comic/1/panel
  Scenario: I make a new panel
    Given comic Santa Rich exists
    When I post endpoint /v1/comic/1/panel with data={}
    Then Show me the Response
    And  response should have id: 1
    
    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/panel/1
  Scenario: I delete a comic
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   panel 2 belongs to Santa Rich
    When I delete endpoint /v1/panel/1
    And  I get endpoint /v1/comic/1/panel
    Then I should get 1 result
    And  I should get id: 2
    And  I should not get id: 1

  #
  # Annotation
  #
  Scenario: I list all annotations available to me
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   annotation Wooo! belongs to panel 1
    And   annotation Let's Party belongs to panel 1
    When I get endpoint /v1/annotation
    Then Show me the Result
    And  I should get 2 results
    And  I should get text: Wooo!
    And  I should get text: Let's Party

  Scenario: I want a particular annotation 
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   annotation Wooo! belongs to panel 1
    And   annotation Let's Party belongs to panel 1
    When I get endpoint /v1/annotation/1
    Then Show me the Result
    And  I should get text: Wooo!
    
  Scenario: I make a new annotation
    When I post endpoint /v1/annotation with data={"text":"Help!"}
    Then Show me the Response
    And  response should have id: 1
    And  response should have text: Help!
    
  Scenario: I delete an annotation
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   annotation Wooo! belongs to panel 1
    And   annotation Let's Party belongs to panel 1
    When I delete endpoint /v1/annotation/2
    And  I get endpoint /v1/annotation
    Then I should get 1 result
    And  I should get text: Wooo!
    And  I should not get text: Let's Party

