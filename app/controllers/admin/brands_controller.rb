class Admin::BrandsController < Admin::BaseController

  crudify :brand,
    :title_attribute => 'name',
    :order => 'name ASC',
    :redirect_to_url => 'admin_products_url'

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(params[:brand])
    @brand.save

    respond_to do |format|
      format.js { @brand }
    end
  end
end
