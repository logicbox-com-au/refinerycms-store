module Admin
  class ProductsController < Admin::BaseController
    before_filter :find_all_brands
    before_filter :find_all_categories

    crudify :product,
            :title_attribute => 'name', :xhr_paging => true

    def index
      unless params[:q].blank?
        @products = Product.where('name like ?', "%#{params[:q]}%").select("id,name")

        render :json => @products.map(&:attributes)
      else
        paginate_all_products

        render :partial => 'products' if request.xhr?
      end
    end

    def find_all_brands
      @brands = Brand.all
      @brand = Brand.new
    end

    def find_all_categories
      @categories = Category.where(:parent_id => nil)
      @category = Category.new
    end

  end
end
