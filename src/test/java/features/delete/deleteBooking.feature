Feature: delete
  Background: consume service
    * url apiUrl
    * def authToken = call read('classpath:features/create/createToken.feature@CreateToken')
    * def create = call read('classpath:features/postABooking/createBooking.feature@Create')

  @Delete
  Scenario: delete a booking  that exist within the API
    Given path 'booking/'
    And path create.id
    And print 'create response', create.createResponse
    * header Content-type = 'application/json'
    * header Cookie = 'token=' + authToken.token
    When method DELETE
    And def deletedId = create.createResponse.bookingid
    And print 'item deleted', deletedId
    Then status 201
    And print 'response', response


  Scenario: delete a reservation without passing the id by parameter
    Given path 'booking/'
    * header Content-type = 'application/json'
    * header Cookie = 'token=' + authToken.token
    When method DELETE
    Then status 404

