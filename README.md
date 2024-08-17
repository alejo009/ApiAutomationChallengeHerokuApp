# Api Automation Testing Booker Challenge HerokuApp

This project is a technical challenge with Karate  Framework using the HerokuApp Api

In this challenge the following endpoints were automated:

1. Auth - CreateToken

2. GetBookingIds

3. GetBooking

4. CreateBooking

5. UpdateBooking

6. PartialUpdateBooking

7. DeleteBooking


# url of the api used

https://restful-booker.herokuapp.com/apidoc/index.html

## Tabla de Contenidos
- [Introduction](#Introduction)
- [Prerequisites to install the project](#Prerequisites-to-install-the-project)
- [How to run the tests locally](#How-to-run-the-tests-locally)


# Introduction

In this project the most common examples of testing with the Karate framework are applied. To apply the test cases we will use the test website https://restful-booker.herokuapp.com/apidoc/index.html , which provides several endpoints on which you can make GET, PUT, POST and DELETE requests.


## Prerequisites to install the project

The project is developed in Java with Gradle so it will install the following software:

## JDK 17, download link:

https://download.oracle.com/java/17/archive/jdk-17_windows-x64_bin.zip


## Gradle:, download link:

https://gradle.org/

## Your favorite IDE, including :
Intellij IDEA: To run features or scenarios tests it will configure:


## How to run the tests locally?

To run the tests, enter your preferred ide, I highly recommend IntelliJ IDEA, go to your terminal and enter the following command:

./gradlew clean test
