module NavigationHelpers
  module Refinery
    module Products
      def path_to(page_name)
        case page_name
        when /the list of products/
          admin_products_path

         when /the new product form/
          new_admin_product_path
         when /the products index/
          products_path
        else
          nil
        end
      end
    end
  end
end
