module ProductsFilter

  def filter_by_brand!
    return unless params[:kind] == 'brand'
    @products = @products.by_brand(params[:kind_name])
  end

  def filter_by_category_name!
    @products = @products.by_category(params[:category_name]) if params[:category_name]
  end

end
