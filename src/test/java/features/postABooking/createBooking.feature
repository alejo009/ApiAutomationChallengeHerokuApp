Feature: Create a booking
  Background: Consume service
    * url apiUrl

    @Create
    Scenario: Create a booking herokuapp
      Given path 'booking'
      And header Accept = 'application/json'
      And request read('classpath:features/postABooking/body.json')
      When method POST
      Then status 200
      And match response == read('classpath:features/postABooking/expectedFormat.json')
      And match response == read('classpath:features/postABooking/expectedValues.json')
      And def id = response.bookingid
      And print id
      * def createResponse = response

      And match response.bookingid == "#present", "#number", "#notnull"
      And match response.[*].firstname == "#present", "#string", "#notnull"
      And match response.[*].lastname == "#present", "#string", "#notnull"
      And match response.[*].totalprice == "#present", "#number", "#notnull"
      And match response.[*].depositpaid == "#present", "#boolean", "#notnull"
      And match response.[*].[*].checkin == "#present", "#date", "#notnull"
      And match response.[*].[*].checkout == "#present", "#date", "#notnull"
      And match response.[*].additionalneeds == "#present", "#string", "#notnull"

      And print 'createResponse: ', response