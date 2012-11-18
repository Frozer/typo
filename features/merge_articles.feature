Feature: Merge Articles
  As a blog administrator
  In order to merge similiar articles.
  I want to be able to merge articles on my blog.

  Background:
    Given the blog is set up
	Given a non admin user exists
	Given the following articles exist:
	| title				| body 		| author 	| user_id 	| permalink		|
	| Hello World 1! 	| Test 1 	| admin		| 1 		| hello-1		|
	| Hello World 2! 	| Test 2	| admin		| 1			| hello-2		|
	| TEST 4 			| Test 3	| user		| 2			| test-4		|

  Scenario: A non-admin cannot merge articles
	Given I am logged into the admin panel as a non-admin
	When I go to the edit article page for article with id 5
	Then I should see "New article"
	Then I should not see "merge_with"
	And I should see "Test 3"
	
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
	Given I am logged into the admin panel
    Given I am on the edit article page for article with id 3
    When I fill in "merge_with" with "4"
	And I press "Merge"
    Then I should be on the admin content page
    Then I should see "Hello World 1!"
	Given I am on the edit article page for article with id 3
    Then I should see "Test 1"
	And I should see "Test 2"
