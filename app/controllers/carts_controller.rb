class CartsController < ApplicationController

  before_filter :find_current_member
  before_filter :find_shopping_cart!

  def index
  end
  
  def create
    product = Product.find(params[:product_id])
    video = Video.find(params[:video_id]) unless params[:video_id].nil?

    @shopping_cart.add_item(product.id, product.price, video.id)
    @shopping_cart.save

    redirect_to carts_path
  end
  
  def update
    cart = Cart.where(:member_id => @member_id).first
    item = cart.items.where(:id => params[:id]).first
    item.quantity = params[:cart_item][:quantity]
    item.save
    render :index
  end

protected

  def find_current_member
    if member_signed_in?
      @member_id = current_member.id
    else
      redirect_to new_member_session_path
    end
  end
end
