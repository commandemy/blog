Feature: Article

  Background:
    Given I have a article titled "An article about coffee" with the text "Lorem ipsum dolor samet"

  Scenario: Accessing new article form
    Given I am on the home page
    When I follow "Create new article"
    Then I should be on the create new article page
    And I should see "New Article"

  Scenario: Creating a article
    Given I am on the create new article page
    When I fill in "article_title" with "My article title"
    And I fill in "article_text" with "Lorem ipsum dolor samet"
    And I press "Save"
    Then I should be on the home page
    And I should see "My article title"

  Scenario: Showing an article
    Given I am on the home page
    When I follow "An article about coffee"
    Then I should see "An article about coffee"
    And I should see "Lorem ipsum dolor samet"

  Scenario: Show the number of characters used in article
    Given I am on the home page
    Then I should see the number of characters of the article displayed

  Scenario: Editing an article
    Given I am on the home page
    When I follow "Edit"
    Then I should see "Edit - An article about coffee"
    And I should see "Lorem ipsum dolor samet"
    When I fill in "article_title" with "An article about Red Bull"
    And I press "Update"
    Then I should be on the home page
    And I should see "An article about Red Bull"

  Scenario: Deleting an article
    Given I am editing an article titled "An article about coffee"
    When I press "Delete"
    Then I should be on the home page
    And I should not see "An article about coffee"

  Scenario: Accessing article API
    When I go to the API endpoint
    Then I should see all articles as json