Feature: Provide API
  In order to have information usable by a mobile app
  As a mobile phone
  I want to retrieve (and submit) information
  
  #Host is http://automicsapi.wp.horizon.ac.uk
  #
  #Note that because these features documents a API, features include url's that 
  #would not normally be appropriate for a cucumber specification

  Background: It's Christmas
    Given organisation Automics exists

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
    Then to do 

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
    And   theme Christmas belongs to organisation Automics
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
    And theme Christmas belongs to organisation Automics
    And theme House Party belongs to organisation Automics
    And theme Log Flume belongs to organisation Alton Towers
    When I get endpoint /v1/organisation/1/theme
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Christmas
    And  I should get name: House Party
    And  I should not get name: Log Flume

  Scenario: I get a particular Theme 
    Given theme Christmas belongs to organisation Automics
    And resource Santa Hat belongs to theme Christmas
    When I get endpoint /v1/theme/1
    Then  Show me the Result
    And   I should get name: Christmas
    And   I should get a list of resources 

  #
  # Resources
  #
  Scenario: I list all resources belonging to a theme
    Given theme Christmas belongs to organisation Automics
    And resource Santa Hat belongs to theme Christmas
    And resource Snow belongs to theme Christmas
    When I get endpoint /v1/theme/1/resource
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Santa Hat
    And  I should get name: Snow

  Scenario: I get a particular Resource 
    Given theme Christmas belongs to organisation Automics
    And resource Snow belongs to theme Christmas
    And resource Santa Hat belongs to theme Christmas
    When I get endpoint /v1/resource/1
    Then Show me the Result
    And  I should get name: Snow
    And  I should not get name: Santa Hat

  #
  # Photo
  #
  Scenario: I list all photos available to me
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to group Jonty's House
    And   photo Liz belongs to group Jonty's House
    When I get endpoint /v1/photo
    Then Show me the Result
    And  I should get 2 results
    And  I should get description: Rich and Mel
    And  I should get description: Liz

  Scenario: I want a particular photo 
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to group Jonty's House
    When I get endpoint /v1/photo/1
    Then Show me the Result
    And  I should get description: Rich and Mel
    And  I should get an image
    And  I should get a thumbnail

    #curl --noproxy localhost --request POST --data 'data={"description":"kittens"}' http://localhost:3000/v1/photo
    #blob is base64 encoded photo data
  Scenario: I share a new photo
    Given group Jonty's House exists
    When I post endpoint /v1/photo with data={"description":"kittens", "name":"tiny.jpg", "blob":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDABALDA4MChAODQ4SERATGCgaGBYWGDEjJR0oOjM9PDkz ODdASFxOQERXRTc4UG1RV19iZ2hnPk1xeXBkeFxlZ2P/2wBDARESEhgVGC8aGi9jQjhCY2NjY2Nj Y2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2NjY2P/wAARCAACAAIDASIA AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3 ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3 uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwDcoooq Sj//2Q=="}
    And  I get endpoint /v1/photo/1
    Then Show me the Result
    And  I should get description: kittens
    And  I should get a photo location with tiny.*jpg

    #curl --noproxy localhost --request PUT --data 'data={"description":"Rich, Liz and Mel"}' http://localhost:3000/v1/photo/1
  Scenario: I change the description of a photo
    Given group Jonty's House exists
    And   photo Rich and Mel belongs to group Jonty's House
    When I post endpoint /v1/photo/1 with data={"description":"Rich, Liz and Mel"}
    And  I get endpoint /v1/photo/1
    Then I should get description: Rich, Liz and Mel

    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/photo/1
  Scenario: I delete a photo
    Given group Jonty's House exists
    And   photo Liz belongs to group Jonty's House
    And   photo Rich and Mel belongs to group Jonty's House
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
    And   comic Mels Bells exists
    When I get endpoint /v1/comic
    Then Show me the Result
    And  I should get 2 results
    And  I should get name: Liz fills the Stockings
    And  I should get name: Mels Bells

  Scenario: I want a particular comic 
    Given group Christmas party exists
    And   comic Mels Bells belongs to group Christmas party
    And   theme Christmas belongs to organisation Automics
    And   theme Christmas is the Christmas party current theme
    And   resource Santa Hat belongs to theme Christmas
    And   panel 1 belongs to Mels Bells
    And   panel 2 belongs to Mels Bells
    When I get endpoint /v1/comic/1
    Then Show me the Result
    And  I should get name: Mels Bells
    And  I should get a list of panels
    And  I should get a list of resources

    #curl --noproxy localhost --request POST --data 'data={"name":"Santa Rich", "description":"Like a ferret up a stove pipe"}' http://localhost:3000/v1/comic
  Scenario: I make a new comic
    When I post endpoint /v1/comic with data={"name":"Santa Rich", "description":"Like a ferret up a stove pipe."}
    Then Show me the Response
    And  response should have name: Santa Rich
    And  response should have description: Like a ferret up a stove pipe.
    
    #curl --noproxy localhost --request PUT --data 'data={"name":"Mels Christmas Bells"}' http://localhost:3000/v1/comic/1
  Scenario: I change the name of a comic
    Given comic Mels Bells exists
    When I post endpoint /v1/comic/1 with data={"name":"Mels Christmas Bells"}
    And  I get endpoint /v1/comic/1
    Then I should get name: Mels Christmas Bells

  Scenario: I change the order of panels
    Given group Christmas party exists
    And   comic Mels Bells belongs to group Christmas party
    And   panel 1 belongs to Mels Bells
    And   panel 2 belongs to Mels Bells
    When I post endpoint /v1/comic/1 with data={"panels":[{"id":1, "page_order":2},{"id":2, "page_order":1}]}
    And  I get endpoint /v1/comic/1
    Then Show me the Result
    And  I should get panel 2 before panel 1

    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/comic/1
  Scenario: I delete a comic
    Given comic Liz fills the Stockings exists
    And   comic Mels Bells exists
    When I delete endpoint /v1/comic/1 
    And  I get endpoint /v1/comic
    Then I should get 1 result
    And  I should get name: Mels Bells
    And  I should not get name: Liz fills the Stockings

  #
  # Panel
  #
  Scenario: I list all panels in my comic
    Given comic Santa Rich exists
    And   comic Mels Bells exists
    And   panel 1 belongs to Santa Rich
    And   panel 2 belongs to Santa Rich
    And   panel 3 belongs to Mels Bells
    And   panel 4 belongs to Santa Rich
    When I get endpoint /v1/comic/1/panel
    Then Show me the Result
    And  I should get 3 results
    And  I should get id: 1
    And  I should get id: 2
    And  I should not get id: 3
    And  I should get id: 4

  Scenario: I list all panels in my group
    Given comic Santa Rich exists
    And   comic Mels Bells exists
    And   panel 1 belongs to Santa Rich
    And   panel 2 belongs to Santa Rich
    And   panel 3 belongs to Mels Bells
    And   panel 4 belongs to Santa Rich
    When I get endpoint /v1/panel
    Then Show me the Result
    And  I should get 4 results
    And  I should get id: 1
    And  I should get id: 2
    And  I should get id: 3
    And  I should get id: 4

  Scenario: I want a particular panel 
    Given comic Mels Bells exists
    And   panel 1 belongs to Mels Bells
    And   a photo with kitten.jpeg is on panel 1
    And   resource Snow exists
    And   resource Snow is placed on panel 1 at 0.5,0.5 scale 1
    And   resource Snow is placed on panel 1 at 0.6,0.4 scale 0.8
    And   annotation Wooo! belongs to panel 1
    And   annotation I Can Haz Cheezburger belongs to panel 1
    When I get endpoint /v1/panel/1
    Then Show me the Result
    And  I should get id: 1
    And  I should get a photo location with kitten.jpeg
    And  I should get placement at 0.5 0.5 scale 1
    And  I should get placement at 0.6 0.4 scale 0.8
    And  I should get a list of annotations
    
    #curl --noproxy localhost --request POST --data 'data={}' http://localhost:3000/v1/comic/1/panel
  Scenario: I make a new panel
    Given comic Santa Rich exists
    When I post endpoint /v1/comic/1/panel with data={}
    Then Show me the Response
    And  response should have id: 1
    
    #curl --noproxy localhost --request DELETE http://localhost:3000/v1/panel/1
  Scenario: I delete a panel
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
  Scenario: I list all annotations on a panel
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   annotation Wooo! belongs to panel 1
    And   annotation Let's Party belongs to panel 1
    When I get endpoint /v1/panel/1/annotation
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
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    When I post endpoint /v1/panel/1/annotation with data={"text":"Help!"}
    Then Show me the Response
    And  response should have id: 1
    And  response should have text: Help!
    
  Scenario: I delete an annotation
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   annotation Wooo! belongs to panel 1
    And   annotation Let's Party belongs to panel 1
    When I delete endpoint /v1/annotation/2
    And  I get endpoint /v1/panel/1/annotation
    Then I should get 1 result
    And  I should get text: Wooo!
    And  I should not get text: Let's Party
  #
  # Placement
  #
  Scenario: I list all placements available to me
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   resource Snow exists
    And   resource Snow is placed on panel 1 at 0.5,0.5 scale 1
    And   resource Snow is placed on panel 1 at 0.6,0.4 scale 0.8
    When I get endpoint /v1/panel/1/placement
    Then Show me the Result
    And  I should get placement at 0.5 0.5 scale 1
    And  I should get placement at 0.6 0.4 scale 0.8

  Scenario: I want a particular placement 
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   resource Snow exists
    And   resource Snow is placed on panel 1 at 0.5,0.5 scale 1
    When I get endpoint /v1/placement/1
    Then Show me the Result
    And  I should get placement at 0.5 0.5 scale 1
    
  Scenario: I make a new placement
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   resource Snow exists
    When I post endpoint /v1/panel/1/resource/1/placement with data={"xoff":0.2, "yoff":0.1, "scale":2.1}
    Then Show me the Response
    And  response should have resource_id: 1
    And  response should have xoff: 0.2
    And  response should have yoff: 0.1
    And  response should have scale: 2.1
    
  Scenario: I delete a placement
    Given comic Santa Rich exists
    And   panel 1 belongs to Santa Rich
    And   resource Snow exists
    And   resource Snow is placed on panel 1 at 0.5,0.5 scale 1.1
    And   resource Snow is placed on panel 1 at 0.6,0.4 scale 0.8
    When I delete endpoint /v1/placement/1
    And  I get endpoint /v1/panel/1/placement
    Then I should not get placement at 0.5 0.5 scale 1.1
    And  I should get placement at 0.6 0.4 scale 0.8

