@login @postLoginKo @contract
Feature: User Login - Invalid Credentials

  Background:
    * url baseUrl

  Scenario Outline: Login fails with invalid credentials - <errorMessage>
    Given path 'users', 'login'
    And request { user: { email: '<email>', password: '<password>' } }
    When method POST
    Then status <expectedStatus>
    And match response.errors.body[0] == '<errorMessage>'

    Examples:
      | email                | password      | expectedStatus | errorMessage                      |
      | not-an-email         | 1234567890    | 404            | Email not found sign in first     |
      | test321@gmail.com    | wrongpassword | 422            | Wrong email/password combination  |
      | nonexistent@test.com | anypassword   | 404            | Email not found sign in first     |