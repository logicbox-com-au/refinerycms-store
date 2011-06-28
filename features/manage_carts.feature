@carts
Feature: Carts
  In order to have carts on my website
  As an administrator
  I want to manage carts

  Background:
    Given I am a logged in refinery user
    And I have no carts

  @carts-list @list
  Scenario: Carts List
   Given I have carts titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of carts
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @carts-valid @valid
  Scenario: Create Valid Cart
    When I go to the list of carts
    And I follow "Add New Cart"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 cart

  @carts-invalid @invalid
  Scenario: Create Invalid Cart (without name)
    When I go to the list of carts
    And I follow "Add New Cart"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 carts

  @carts-edit @edit
  Scenario: Edit Existing Cart
    Given I have carts titled "A name"
    When I go to the list of carts
    And I follow "Edit this cart" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of carts
    And I should not see "A name"

  @carts-duplicate @duplicate
  Scenario: Create Duplicate Cart
    Given I only have carts titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of carts
    And I follow "Add New Cart"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 carts

  @carts-delete @delete
  Scenario: Delete Cart
    Given I only have carts titled UniqueTitleOne
    When I go to the list of carts
    And I follow "Remove this cart forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 carts
