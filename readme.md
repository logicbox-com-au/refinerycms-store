# Store engine for Refinery CMS.

Simple engine to create a product catalog and basic shopping cart

## Install

Refinerycms-store views are in haml so add to your Gemfile

    gem 'haml'
    gem 'refinerycms-store', '0.0.1'

And run

    bundle install

Now you should run new migrations

    rake db:migrate

