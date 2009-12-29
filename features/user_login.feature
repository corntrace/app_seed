Feature: Customer could login to this site

  Scenario: a registered customer want to login with valid params
		Given an existed user "corntrace"
		And I am on the login page
		When I fill in "user_session" form the following:
		  | username | corntrace | 
		  | password | secret    | 
		And I press "Log in"
		Then I should be on the root page
		And I should see "corntrace" within "div.nav"

	Scenario: anyone attemp to login with invalid params
		Given I am on the login page
		When I fill in "user_session" form the following:
		  | username | not-exist | 
		  | password | badpasswd | 
		And I press "Log in"
		Then I should see /username/ within "div.errorExplanation"
