@products
Feature: Products
  In order to have products on my website
  As an administrator
  I want to manage products

  Background:
    Given I am a logged in refinery user
    And I have no products

  @products-list @list
  Scenario: Products List
   Given I have products titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of products
   Then I should see "2 Products"
   And I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @product-list-ordered @list
  Scenario: Products list ordered by most love
    Given I have a foo product with 3 loves and 5 comments
    And I have a bar product with 5 loves and 2 comments
    When I go to the list of products
    When I follow "Most loved"
    Then "bar product" product should appear before "foo product"
    When I follow "Most commented"
    Then "foo product" product should appear before "bar product"

  @products-valid @valid
  Scenario: Create Valid Product
    When I go to the list of products
    And I follow "Add New Product"
    And I fill in "Name" with "foo product"
    And I fill in "product_description" with "This is a foo description"
    And I fill in "product_price" with "9.99"
    And I press "Save"
    Then I should see "'foo product' was successfully added."
    And I should have 1 product

  @products-invalid @invalid
  Scenario: Create Invalid Product (without name)
    When I go to the list of products
    And I follow "Add New Product"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 products

  @products-edit @edit
  Scenario: Edit Existing Product
    Given I have products titled "A name"
    When I go to the list of products
    And I follow "Edit this product" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of products
    And I should not see "A name"

  @products-duplicate @duplicate
  Scenario: Create Duplicate Product
    Given I only have products titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of products
    And I follow "Add New Product"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 products

  @products-delete @delete
  Scenario: Delete Product
    Given I only have products titled UniqueTitleOne
    When I go to the list of products
    And I follow "Remove this product forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 products

  @products-lovecount
  Scenario: Display love count
    Given I only have a foo product with 5 loves and 0 comments
    When I go to the list of products
    Then I should see "5 loves"

  @products-commentscount
  Scenario: Display comments count
    Given I only have a foo product with 0 loves and 3 comments
    When I go to the list of products
    Then I should see "3 comments"
