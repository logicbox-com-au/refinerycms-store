require 'spec_helper'

describe Cart do

  def reset_cart(options = {})
    @valid_attributes = {
      :id => 1,
      :name => "RSpec is great for testing too"
    }

    @cart.destroy! if @cart
    @cart = Cart.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_cart
  end

  context "validations" do
    
    it "rejects empty name" do
      Cart.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_cart
      Cart.new(@valid_attributes).should_not be_valid
    end
    
  end

end