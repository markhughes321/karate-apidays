@articles @postArticleOk @contract @ignore
Feature: Create Article - Valid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken
    * def uniqueId = java.lang.System.currentTimeMillis()
    * def articleTitle = 'Shifting left - ' + uniqueId
    * def expectedResponse = read('classpath:conduit/responses/articles/postArticleOk.json')

  Scenario: Create article Ok
    Given path 'articles'
    And request 
    """
    {
      "article": {
        "title": "#(articleTitle)",
        "description": "An article about shifting left in testing",
        "body": "Shifting left means testing earlier in the development process...",
        "tagList": ["testing", "devops", "qa"]
      }
    }
    """
    When method POST
    Then status 201
    And match response == expectedResponse