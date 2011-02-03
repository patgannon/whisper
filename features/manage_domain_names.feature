
Feature: Manage domain names
  In order to make project webs available via dns names
  Vendor
  wants to be able to add domain names to projects


Scenario: View web site on custom domain name
  Given I am "foobar@example.com" managing projects:
    |name|description|
    |Build software to manage a web site|description 1|
    |Profit|description 2|
  And within project "Profit" I create the following pages:
    |title|html|
    |Home|Welcome to my site|
    |Contact Us|Dial 1-800-222-1234|
  And I have created the domain name "coolio.com" for project "Profit"
  Then using "coolio.com" I browse:
    |visit|expect|
    |/Home|Welcome to my site|
