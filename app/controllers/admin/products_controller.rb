module Admin
  class ProductsController < Admin::BaseController
    before_filter :find_all_brands
    before_filter :find_all_categories

    crudify :product,
            :title_attribute => 'name', :xhr_paging => true

    def index
      unless params[:search].blank?
        query_products= {:title_or_description_contains => params[:search] }
        products = Product.search(query_products)
        @products = products.relation
      else
        per_page = params[:per_page].present? ? params[:per_page].to_i : 20
        params[:page] ||= 1
        @products = Product
        @products = case params[:order]
                   when 'loved'
                     @products.order('loves_count DESC').paginate(:page => params[:page], :per_page => per_page)
                   when 'commented'
                     @products.order('comments_count DESC').paginate(:page => params[:page], :per_page => per_page)
                   else
                     @products.paginate(:page => params[:page], :per_page => per_page)
                   end
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
