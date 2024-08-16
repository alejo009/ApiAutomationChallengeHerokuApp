Feature: update a booking
  Background: consume service
    * url apiUrl
    * def authToken = call read('classpath:features/create/createToken.feature@CreateToken')
    * def create = call read('classpath:features/postABooking/createBooking.feature@Create')

    Scenario: update a existing booking
      Given path 'booking/'
      And path create.id
      And print 'create response', create.createResponse
      * header Content-type = 'application/json'
      * header Accept = 'application/json'
      * header Cookie = 'token=' + authToken.token
      And print authToken.token
      And request read ('classpath:features/puts/body.json')
      When method PUT
      Then status 200
      And match response == read('classpath:features/puts/expectedValues.json')
      And match $.[*].firstname == '#present', '#string', '#notnull'
      And match $.[*].lastname == '#present', '#string', '#notnull'
      And match $.[*].totalprice == '#present', '#number', '#notnull'
      And match $.[*].depositpaid == '#present', '#boolean', '#notnull'
      And match $.[*].[*].checkin == '#present', '#date', '#notnull'
      And match $.[*].[*].checkout == '#present', '#date', '#notnull'
      And match $.[*].additionalneeds == '#present', '#string', '#notnull'
      And print 'UpdateResponse', response

    Scenario: update a existing booking with incorrectBody
      Given path 'booking/'
      And path create.id
      And print 'create response', create.createResponse
      * header Content-type = 'application/json'
      * header Accept = 'application/json'
      * header Cookie = 'token=' + authToken.token
      And print authToken.token
      And request read ('classpath:features/puts/incorrectBodyUpdateBooking.json')
      When method PUT
      Then status 400
      And match response == 'Bad Request'

    Scenario: update a partial booking
      Given path 'booking/'
      And path create.id
      And print 'create response', create.createResponse
      * header Content-type = 'application/json'
      * header Accept = 'application/json'
      * header Cookie = 'token=' + authToken.token
      And print authToken.token
      And request read('classpath:features/puts/partialUpdateBookingBody.json')
      When method PATCH
      Then status 200
      And match response == read('classpath:features/puts/expectedPartialUpdateBookingValues.json')
      And match $.[*].firstname == '#present', '#string', '#notnull'
      And match $.[*].lastname == '#present', '#string', '#notnull'
      And match $.[*].totalprice == '#present', '#number', '#notnull'
      And match $.[*].depositpaid == '#present', '#boolean', '#notnull'
      And match $.[*].[*].checkin == '#present', '#date', '#notnull'
      And match $.[*].[*].checkout == '#present', '#date', '#notnull'
      And match $.[*].additionalneeds == '#present', '#string', '#notnull'
      And print 'UpdateResponse', response

    Scenario: update a partial booking without token
      Given path 'booking/'
      And path create.id
      And print 'create response', create.createResponse
      * header Content-type = 'application/json'
      * header Accept = 'application/json'
      And request read('classpath:features/puts/partialUpdateBookingBody.json')
      When method PATCH
      Then status 403
      And match response == 'Forbidden'