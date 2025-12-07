@login @postLoginOk 
Feature: User Login - Valid Credentials

  Background:
    * url baseUrl
    * def expectedResponse = read('classpath:conduit/responses/auth/postLoginOk.json')

  Scenario: Login Ok
    Given path 'users', 'login'
    And request { user: { email: '#(email)', password: '#(password)' } }
    When method POST
    Then status 200
    And match response == expectedResponse
    * def authToken = response.user.token