Feature: Elasticsearch server
  In order to provide search capabilities to client apps
  I want to have a running elasticsearch server

  Background:
    Given I have provisioned the following infrastructure:
    | Server Name     | Operating System | Version | Chef Version | Run List               |
    | elasticsearch   | ubuntu           |   14.04 |      11.12.2 | odi-elasticsearch-node |
    And I have run Chef

  Scenario: Search server is running
    Given a service is running on port "9200" on "elasticsearch-elasticsearch"
    When I visit "/"
    Then I should get a successful response
    And I should see "You Know, for Search"
