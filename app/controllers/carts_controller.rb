class CartsController < ApplicationController

  before_filter :find_all_carts
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @cart in the line below:
    present(@page)
  end

  def show
    @cart = Cart.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @cart in the line below:
    present(@page)
  end

protected

  def find_all_carts
    @carts = Cart.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/carts").first
  end

end