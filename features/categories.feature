Feature: Manage Categories
  As a blog administrator
  In order to manage categories
  I want to be able to manage categories on my blog.

  Background:
    Given the blog is set up

  Scenario: Create a new category
    Given I am logged into the admin panel
	Given I am on the categories page
	Then I should see "Categories"
	When I fill in "Name" with "Category1"
	And I fill in "Description" with "TestCat123"
	Then I press "Save"
	Then I should be on the categories page
	Then I should see "Category1"
	And I should see "TestCat123"