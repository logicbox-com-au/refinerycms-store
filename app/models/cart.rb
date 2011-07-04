class Cart < ActiveRecord::Base

  acts_as_indexed :fields => [:id]
  
  has_many :items, :class_name => "CartItem", :dependent => :destroy
  
  has_friendly_id :cart_name, :use_slug => true

  belongs_to :member
  
  def add_item(product, price)
    if item = self.items.where(:product_id => product).first
      item.quantity += 1
      item.save
    else
      self.items.create(:product_id => product, :price => price)
    end
  end
  
  def cart_name
    if member.first_name.blank? & member.last_name.blank?
      member.email.split("@")[0]
    else
      member.first_name + ' ' + member.last_name
    end
  end
  
  def subtotal
    items.map(&:subtotal).reduce(:+)
  end
  
end
