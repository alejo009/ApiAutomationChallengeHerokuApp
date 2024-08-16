@ignore
Feature:connection

  Background: consume service
    * url 'https://restful-booker.herokuapp.com/'

  @CreateToken
  Scenario: Authentication test
    * def privateSettings = read('classpath:resources/privateSettings.json')
    Given path 'auth'
    Given header Accept = 'application/json'
    And request
      """
      {
                username: '#(privateSettings.TenantCredentials.username)',
                password: '#(privateSettings.TenantCredentials.password)'
      }
      """
    When method POST
    Then status 200
    * def token = response.token
    And match token == "#present", "#string", "#notnull"