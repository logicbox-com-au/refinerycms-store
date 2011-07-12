class ProductsController < ApplicationController
  helper :love
  helper :rank
  helper :worn
  helper :share
  include ProductsFilter

  before_filter :find_page

  def index
    present(@page)

    products!

    @branch = params[:kind] ? params[:kind] : params[:resource]
    @leaf = params[:kind_name] ? params[:kind_name] : params[:filter_name]
    
  end

  def show
    @product = Product.find(params[:id])
    @related_videos = Video.by_product @product
    
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @product in the line below:
    present(@page)
  end
  
protected

  def find_page
    @page = Page.where(:link_url => "/products").first
  end
  
end
