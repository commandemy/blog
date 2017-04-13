Feature: Guestbook

  Scenario: Access guestbook page
    Given I am on the home page
    When I follow "Guestbook"
    Then I should see a <comment> by a <visitor>

      | comment                 | visitor |
      | Great site!             | Bob     |
      | Wow. What a great blog  | Lisa    |
      | Love the site :)        | Jeff    |