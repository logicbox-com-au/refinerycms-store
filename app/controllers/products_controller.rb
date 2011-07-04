class ProductsController < ApplicationController
  helper :love
  helper :rank
  helper :worn

  before_filter :find_page

  def index
    order = 'created_at DESC'
    if params[:order]
      order = 'loves_count DESC' if params[:order] == 'loved'
      order = 'worns_count DESC' if params[:order] == 'worns'
      order = 'price DESC' if params[:order] == 'highest-price'
      order = 'price ASC' if params[:order] == 'lowest-price'

    end
    @products = Product.order(order)

    if params[:filter]
      manual_filter = ManualFilter.where(:name => params[:filter]).first
      if (manual_filter)
        products_id = manual_filter.product_sources.select('products.id').map{|p| p.id}
        @products = @products.where(:id => products_id)
      end
    end

    @products = @products.by_brand(params[:brand_name]) if params[:brand_name]
    @products = @products.by_category(params[:category_name]) if params[:category_name]
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end

  def show
    @product = Product.find(params[:id])
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end
  
protected

  def find_page
    @page = Page.where(:link_url => "/products").first
  end
  
end
