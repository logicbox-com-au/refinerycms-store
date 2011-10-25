# Store engine for Refinery CMS.

Simple engine to create a product catalog and basic shopping cart

## Install

Refinerycms-products views are in haml so add to your Gemfile

    gem 'haml'
    gem 'refinerycms-products', 

And run

    bundle install
    
    rails g refinerycms_products
    rails g refinerycms_carts

Now you should run new migrations

    rake db:migrate

