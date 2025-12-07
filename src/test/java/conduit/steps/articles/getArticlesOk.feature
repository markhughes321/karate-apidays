@articles @getArticlesOk @contract @ignore
Feature: Get Articles - Valid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken
    * def expectedResponse = read('classpath:conduit/responses/articles/getArticlesOk.json')

  Scenario: Get articles Ok
    Given path 'articles'
    And param limit = 3
    And param offset = 0
    When method GET
    Then status 200
    And match each response.articles[*] == expectedResponse