Feature: get bookings

  Background: consume service
    * url apiUrl

  Scenario: get all bookings ids
    Given path 'booking'
    When method GET
    Then status 200
    * print response
    And match $.[*].bookingid == '#number', '#present', '#notnull'


  Scenario: get all bookings ids with incorrect path
    Given path 'incorrectpath'
    When method GET
    Then status 404
    And match response == 'Not Found'