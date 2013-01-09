Feature: Provide a chivelrous API
  In order to be as easy to use as possible the api should support multiple formats and protect against common errors.
  As a mobile phone
  I want to submit information that is understood where possible (not simply to the letter of the API), and that will not cause damage to the data or the structure of the already stored data if I make errors.

  Background: It's Christmas
    Given organisation Automics exists

  Scenario: I post with json content type
    When I post endpoint /v1/group sending {data:{"name":"Mike's Party"}} and headers {'CONTENT_TYPE' => 'application/json'}
    Then Show me the Result
    Then response should have name: Mike's Party
    And  response should have a SHA1 hash

  Scenario: I post with json content type and accept
    When I post endpoint /v1/group sending {data:{"name":"Mick's Party"}} and headers {'ACCEPT' => 'application/json', 'CONTENT_TYPE' => 'application/json'}
    Then Show me the Result
    Then response should have name: Mick's Party
    And  response should have a SHA1 hash


