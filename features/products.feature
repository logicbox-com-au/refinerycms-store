@products
Feature: Products
  In order to have products on my website
  As an member
  I want to view products

  Background:
    Given A Refinery user exists
    And I only have a foo product

  @products-index
  Scenario: Products index
   Given I have products titled Product002
   When I go to the products index
   Then I should see "foo product"
   And I should see "Product002"

  @product-show
  Scenario: Show product
   When I go to the products index
   Then I should see "foo product"
   When I follow "foo product"
   Then I should see "description for product"

  @javascript @product-love
  Scenario: Love product
   Given I am a new, authenticated member "tester@example.com" with password "123456"
   When I go to the products index
   And I follow "foo product"
   Then I should see "0 LOVE"
   When I follow "0 LOVE"
   Then I should see "1 UNLOVE"
   When I follow "1 UNLOVE"
   Then I should see "0 LOVE"

  @javascript @product-worn
  Scenario: Worn product
   Given I am a new, authenticated member "tester@example.com" with password "123456"
   When I go to the products index
   And I follow "foo product"
   Then I should see "0 WORN"
   When I follow "day" within "#worns"
   Then I should see "1 UNWORN"
   When I follow "1 UNWORN"
   Then I should see "0 WORN"
   When I follow "day" within "#worns"
   Then I should see "1 UNWORN"
   When I follow "1 UNWORN"
   Then I should see "0 WORN"
   When I follow "evening" within "#worns"
   Then I should see "1 UNWORN"
   When I follow "1 UNWORN"
   Then I should see "0 WORN"

