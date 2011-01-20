Feature: Manage project pages
  In order to maintain information about a project
  User
  wants to be able to create one or more html pages about any project.
  
  Scenario: Edit project main page
    Given I am logged in
    Given the following projects:
      |name|description|
      |name 1|description 1|
      |name 2|description 2|
    When I manage the 1st project web site
    Then I should see "Manage project name 1"

  Scenario: Try to edit someone else's pages
    Given I am not logged in
    When I go to any project page
    Then I should not see "Manage"
    
  Scenario: Edit my own page
    Given I am logged in
    And I have created a project
    When I edit that project
    Then I should see "Manage Web"
    
  Scenario: Edit my project's web
    Given I am logged in
    And I manage my own project
    And I click "Manage Web"
    Then I should see editable content
    
