require 'spec_helper'

describe Brand do
  def reset_brand(options = {})
    @valid_attributes = {
      :name => "foo",
    }
    @brand.destroy! if @brand
    @brand = Brand.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_brand
  end
  
  context "validations" do
    
    it "rejects empty name" do
      Brand.new(@valid_attributes.merge(:name => "")).should_not be_valid
    end

    it "rejects non unique name" do
      # as one gets created before each spec by reset_product
      Brand.new(@valid_attributes).should_not be_valid
    end
    
  end

end
