@articles @getArticlesKo
Feature: Get Articles - Invalid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken

  Scenario Outline: Get articles fails with invalid parameters - <errorMessage>
    Given path 'articles'
    And param limit = <limit>
    And param offset = <offset>
    When method GET
    Then status <expectedStatus>

    Examples:
      | limit | offset | expectedStatus | errorMessage           |
      | -1    | 0      | 400            | Invalid limit          |
      | 0     | -1     | 400            | Invalid offset         |
