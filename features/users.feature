Feature: Users

  Scenario: Frequent writers
    Given a user that wrote 10 articles
    Then this user is a frequent writer

  Scenario: Creating Users
    Given the following users
      | user          | articles  |
      | aslakhellesoy | 317       |
      | jbrueder      | 33        |
      | ehaselwanter  | 51        |
    Then I expect the following users to exist