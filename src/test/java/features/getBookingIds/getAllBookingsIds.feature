Feature: get bookings

  Background: consume service
    * url apiUrl

  Scenario: get all bookings ids
    Given path 'booking'
    When method GET
    Then status 200

  Scenario: get all bookings ids with incorrect path
    Given path 'incorrectpath'
    When method GET
    Then status 404