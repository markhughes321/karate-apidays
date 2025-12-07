@articles @postArticleKo @contract
Feature: Create Article - Invalid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken

  Scenario Outline: Article creation fails - <errorMessage>
    Given path 'articles'
    And request
      """
      {
        "article": {
          "title": <title>,
          "description": <description>,
          "body": <body>,
          "tagList": <tagList>
        }
      }
      """
    When method POST
    Then status 422
    And match response.errors.body[0] == '<errorMessage>'

    Examples:
      | title         | description         | body                 | tagList  | errorMessage             |
      | null          | 'Valid description' | 'Valid body content' | ['tag1'] | A title is required      |
      | 'Valid Title' | null                | 'Valid body content' | ['tag1'] | A description is required |