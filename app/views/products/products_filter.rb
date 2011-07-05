module ProductsFilter
  def sort_products!
    order = 'created_at DESC'
    if params[:order]
      order = 'loves_count DESC' if params[:order] == 'loved'
      order = 'worns_count DESC' if params[:order] == 'worns'
      order = 'price DESC' if params[:order] == 'highest-price'
      order = 'price ASC' if params[:order] == 'lowest-price'

    end
    @products = @products.nil? ? Product.order(order) : @products.order(order)
  end

  def filter_by_brand!
    @products = @products.by_brand(params[:brand_name]) if params[:brand_name]
  end

  def filter_by_category_name!
    @products = @products.by_category(params[:category_name]) if params[:category_name]
  end

  def apply_manual_filters!
    if params[:filter]
      manual_filter = ManualFilter.where(:name => params[:filter]).first
      if manual_filter
        products_id = manual_filter.product_sources.select('products.id').map{|p| p.id}
        @products = @products.where(:id => products_id)
      end
    end
  end
end
