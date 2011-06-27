class Admin::CategoriesController < Admin::BaseController
  crudify :category,
    :title_attribute => 'name',
    :order => 'name ASC',
    :redirect_to_url => 'admin_products_url'

  def new
    @parents = Category.where(:parent_id => nil)
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    @category.save

    respond_to do |format|
      format.js { @category }
    end
  end
end
