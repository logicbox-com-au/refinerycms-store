module Refinerycms
  module Store
    module ShoppingCart
      module Controllers
        module Helpers
          extend ActiveSupport::Concern

          include do
            helper_method :find_shopping_cart!
          end

          module InstanceMethods
            def current_cart=(value)
              session[:cart_id] = value
            end

            def current_cart
              session[:cart_id]
            end

            def find_shopping_cart!
              @shopping_cart = Cart.find_or_create_by_member_id(current_member.id)
            end
          end
        end
      end
    end
  end
end
