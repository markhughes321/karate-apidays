@articles @deleteArticleOk @contract @ignore
Feature: Delete Article - Valid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken

  Scenario: Delete Article Ok
    Given path 'articles', articleSlug
    When method DELETE
    Then status 200
    And match response.message.body[0] == 'Article deleted successfully'