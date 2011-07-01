module Refinerycms
  module Store
    module ShoppingCart
      module Controllers
        autoload :Helpers, 'controllers/helpers'
      end
    end
    
    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "products"
          plugin.activity = {
            :class => Product,
            :title => 'name'
          }
        end
        Refinery::Plugin.register do |plugin|
          plugin.name = "categories"
          plugin.hide_from_menu = true
          plugin.activity = {
            :class => Category,
            :title => 'name'
          }
        end
        Refinery::Plugin.register do |plugin|
          plugin.name = "brands"
          plugin.hide_from_menu = true
          plugin.activity = {
            :class => Brand,
            :title => 'name'
          }
        end
      end
    end
  end
end
require File.expand_path('../refinerycms-carts', __FILE__)
