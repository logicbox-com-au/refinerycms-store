class CartItemsController < ApplicationController
  
  before_filter :find_current_member
  
  def destroy
    cart = Cart.where(:member_id => @member_id).first
    item = cart.items.where(:id => params[:id]).first
    item.destroy
    redirect_to carts_path
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