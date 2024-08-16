Feature: get a specific booking
  Background:
    * url apiUrl
    * def create = call read('classpath:features/postABooking/createBooking.feature@Create')

  Scenario: get a specific booking for your id
    Given path 'booking', create.id
    And header Accept = 'application/json'
    When method GET
    Then status 200
    And print 'response ' , response
    And match $.[*].firstname == '#present', '#string' , '#notnull'
    And match $.[*].lastname == '#present', '#string', '#notnull'
    And match $.[*].totalprice == '#present', '#number', '#notnull'
    And match $.[*].depositpaid == '#present', '#boolean', '#notnull'
    And match $.[*].[*].checkin == '#present', '#date', '#notnull'
    And match $.[*].[*].checkout == '#present', '#date', '#notnull'
    And match response.[*].additionalneeds == '#present', '#string', '#notnull'


  Scenario: get a specific booking with id incorrect
    Given path 'booking', 'a900'
    And header Accept = 'application/json'
    When method GET
    Then status 404
    And match response == 'Not Found'
    And print 'response' , response


  Scenario: get a specific booking but without sending it in the header that accepts application/json
    Given path 'booking', create.id
    When method GET
    Then status 418
    And print 'response' , 'response'