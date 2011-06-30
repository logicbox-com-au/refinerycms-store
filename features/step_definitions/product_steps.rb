Given /^I have no products$/ do
  Product.delete_all
end

Given /^I have a product titled "([^\"]*)"$/ do |name|
  brand = Brand.first || Brand.create!(:name => "Brand001")
  category = Category.first || Category.create!(:name => "Category1")
  sub_category = Category.where('parent_id is null').first || Category.create!(:name => "Category1.1", :parent => category)
  Product.create!(
    :name => name,
    :description => "description for product",
    :price => 9.99,
    :brand => brand,
    :category => category,
    :sub_category => sub_category
  )
end

Given /^I (only )?have products titled "?([^\"]*)"?$/ do |only, titles|
  Product.delete_all if only
  titles.split(', ').each do |title|
    Given %{I have a product titled "#{title}"}
  end
end

Given /^I only have a foo product$/ do
  Product.delete_all 
  Given %{I have a product titled "foo product"}
end

Then /^I should have ([0-9]+) products?$/ do |count|
  Product.count.should == count.to_i
end
