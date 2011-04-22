Feature: Manage domain names
  In order to make project webs available via dns names
  Vendor
  wants to be able to add domain names to projects

  Scenario: Edit project main page
    Given I am logged in as "somebody@gmail.com"
    And the following projects owned by "somebody@gmail.com":
      |name|description|
      |My First Project|description 1|
      |My Second Project|description 2|
    When I manage the 1st project web site
    Then I should be on the project pages index for "My First Project"
    And I should see "Web Pages for project My First Project"
    And I should see "Make a web page"

