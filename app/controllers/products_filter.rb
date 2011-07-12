module ProductsFilter

  def filter_by_brand!
    return unless params[:kind] == 'brand'
    @products = @products.by_brand(params[:kind_name])
  end

  def filter_by_category_name!
    return unless params[:kind] == 'category'
    @products = @products.by_category(params[:kind_name])
  end

  def products!
    if params[:search]
      query {:name_or_description_contains => params[:search][:query]}
      @products = Product.search(query)
    else
      @resource = params[:resource].to_sym unless params[:resource].nil?
      if @resource
        apply_manual_filters! @resource
        return
      end

      @products = Product.order(sort_condition)

      filter_by_category_name!
      filter_by_brand!
    end

    @products = @products.includes(:love).includes(:worn).paginate(:page => params[:page], :per_page => 32)
  end
end
