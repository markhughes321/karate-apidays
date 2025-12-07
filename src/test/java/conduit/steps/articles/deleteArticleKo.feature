@articles @deleteArticleKo
Feature: Delete Article - Invalid Request

  Background:
    * url baseUrl
    * header Authorization = 'Token ' + authToken

  Scenario Outline: Article deletion fails - <errorMessage>
    Given path 'articles', '<slug>'
    When method DELETE
    Then status <expectedStatus>
    And match response.errors.body[0] contains '<errorMessage>'

    Examples:
      | slug                            | expectedStatus | errorMessage      |
      | non-existent-article-slug-12345 | 404            | Article not found |
      | !!!invalid!!!                   | 404            | Article not found |
