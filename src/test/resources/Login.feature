#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
Feature: logging in as a user

Scenario Outline: logging in with correct credentials
	Given the user is on the PetApp home page
	And the user clicks the Log In link
	When the user enters "<username>" and "<password>" to log in
	And the user clicks the login button
	Then the navbar says "<username>"
	
	Examples:
		|		username		|		password		|
		|		Hdejesus		|		pass1				|
		|		Edejesus		|		pass2				|
		|		Jdejesus		|		pass3				|
		
Scenario Outline: logging in with incorrect passwords
	Given the user is on the LogIn page
	And the user clicks the Log In link
	When the user enters "<username>" and "<password>" to log in
	And the user clicks the login button
	Then the page says Incorrect Credentials
	
	Examples:
		|		username		|		password				|
		|		henryde			|		password1				|
		|		henrydej		|		Password2				|
		|		Alvarado		|		1234						|
