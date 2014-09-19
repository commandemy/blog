Feature: Post

  Background:
    Given I have a post titled "A post about coffee" with the text "Lorem ipsum dolor samet"

  Scenario: Accessing new post form
    Given I am on the home page
    When I follow "Create new post"
    Then I should be on the create new post page
    And I should see "New Post"

  Scenario: Creating a post
    Given I am on the create new post page
    When I fill in "post_title" with "My post title"
    And I fill in "post_text" with "Lorem ipsum dolor samet"
    And I press "Save"
    Then I should be on the home page
    And I should see "My post title"

  Scenario: Showing a post
    Given I am on the home page
    When I follow "A post about coffee"
    Then I should see "A post about coffee"
    And I should see "Lorem ipsum dolor samet"

  Scenario: Editing a post
    Given I am on the home page
    When I follow "Edit"
    Then I should see "Edit - A post about coffee"
    And I should see "Lorem ipsum dolor samet"
    When I fill in "post_title" with "A post about Red Bull"
    And I press "Update"
    Then I should be on the home page
    And I should see "A post about Red Bull"

  Scenario: Deleting a post
    Given I am editing a post titled "A post about coffee"
    When I press "Delete"
    Then I should be on the home page
    And I should not see "My new post title"

  Scenario: Show the number of characters used in post
    Given I am on the home page
    Then I should see the number of characters of the post displayed 
