Feature: User registeration

  Scenario: user register with valid params.
		Given I am on the signup page
		When I fill in "user" form the following:
			| username              | corntrace           | 
		  | email                 | corntrace@gmail.com | 
		  | password              | 11111               | 
		  | password_confirmation | 11111               |
		And I press "Sign up"
		Then I should be on the root page

  Scenario: user register with invalid params.
		Given I am on the signup page
		When I fill in "user" form the following:
			| username              | corntrace   | 
			| email                 | bademail    | 
			| password              | 11111       | 
			| password_confirmation | badpassword | 
		And I press "Sign up"
		Then I should see /email/ within "div#errorExplanation"

	Scenario: user register with a taken username.
		Given an existed user: "corntrace"
		And I am on the signup page
		When I fill in "user" form the following:
			 | username              | corntrace       | 
			 | email                 | other@email.com | 
			 | password              | secret          | 
			 | password_confirmation | secret          | 
		And I press "Sign up"
		Then I should see /username/ within "div#errorExplanation"
		And there should be no new user created
		And the user "corntrace"'s message should not be changed
