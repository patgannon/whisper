Feature: Manage project pages
  In order to maintain information about a project
  User
  wants to be able to create one or more html pages about any project.
  

  Scenario: Edit project main page
    Given I am logged in as "tgannon@gmail.com"
    And the following projects owned by "tgannon@gmail.com":
      |name|description|
      |My First Project|description 1|
      |My Second Project|description 2|
    When I manage the 1st project web site
    Then I should see "Web Pages for project My First Project"
    And I should see "Make a web page"
    
  Scenario: Make a new web page
    Given I am "tgannon@gmail.com" managing projects:
      |name|description|
      |Build software to manage a web site|description 1|
      |Profit|description 2|
    And I manage the 1st project web site
    And I click on "Make a web page"
    When I fill in "page_title" with "Check out whisper.com"
    And press "New Page"
    Then I should be on the edit page for "Check out whisper.com"
    And I should see "Check out whisper.com"
    
