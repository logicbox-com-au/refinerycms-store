require 'factory_girl'

Factory.define :brand do |b|
  b.sequence(:name) { |n| "brand#{n}" }
end

Factory.define :category do |c|
  c.sequence(:name) { |n| "category#{n}" }
end

Factory.define :sub_category, :class => 'category' do |s|
  s.sequence(:name) { |n| "sub category#{n}" }
end

Factory.define :product do |p|
  brand = Brand.first || Factory(:brand)
  category = Category.first || Factory(:category)
  sub_category = Category.where('parent_id is not NULL').first || Factory(:sub_category, :parent => category)
    p.sequence(:name) { |n| "product#{n}" }
    p.sequence(:description) { |n| "description for product#{n}" }
    p.price 9.99
    p.brand brand
    p.category category
    p.sub_category sub_category
end

