Feature: Manage projects
  In order to better his life
  User
  wants to be able to create a list of projects.

  Scenario: I view my own projects
  Given I am logged in as "tgannon@gmail.com"
  And the following projects owned by "tgannon@gmail.com":
    |name|description|
    |name 1|description 1|
    |name 2|description 2|
  When I go to the my projects page
  Then I should be on the my projects page
  And I should see "My Projects"
  And I should see "name 2"
  
  Scenario: Register new project
    Given I am logged in as "tgannon@gmail.com"
      And I am on the new project page
    When I fill in "Name" with "name 1"
      And I fill in "Description" with "description 1"
      And I press "Create Project"
    Then I should see "name 1"
      And I should see "description 1"
    
  Scenario: Only manage my own projects
    Given I am logged in as "tgannon@gmail.com"
    And I have created a project with title "Tyler's Project"
    When I log in as "othertg@gmail.com"
    And I go to the my projects page
    Then I should not see "Tyler's Project"
  
