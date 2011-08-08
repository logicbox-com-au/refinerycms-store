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

  def destroy
    @category, @subcategory = Category.destroy_category_or_subcategory params
    if @subcategory.try(:destroyed?)
      flash[:notice] = "Sub Category \"#{@subcategory.name}\"  has been deleted"
    elsif @category.try(:destroyed?)
      flash[:notice] = "Category \"#{@category.name}\" has been deleted"
    else
      flash[:notice] = "Seems like the category doesn't exist"
    end
  end
end
