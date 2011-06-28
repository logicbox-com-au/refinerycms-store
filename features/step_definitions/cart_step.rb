Given /^I have no carts$/ do
  Cart.delete_all
end

Given /^I (only )?have carts titled "?([^\"]*)"?$/ do |only, titles|
  Cart.delete_all if only
  titles.split(', ').each do |title|
    Cart.create(:name => title)
  end
end

Then /^I should have ([0-9]+) carts?$/ do |count|
  Cart.count.should == count.to_i
end