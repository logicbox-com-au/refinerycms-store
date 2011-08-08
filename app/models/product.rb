class Product < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :description]
  alias_attribute :title, :name

  has_friendly_id :name, :use_slug => true
  
  has_many :comments, :as => :comentable, :dependent => :destroy

  validates :name, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :price, :presence => true

  belongs_to :picture, :class_name => 'Image'
  belongs_to :brand
  belongs_to :category
  belongs_to :sub_category, :class_name => 'Category'
  
  has_many :love, :as => :loveable, :dependent => :destroy
  has_many :worns, :as => :wornable, :dependent => :destroy
  has_many :cart_items, :dependent => :destroy
  
  after_save :expire_cache
  before_destroy :ensure_not_referenced_by_any_cart_item

  delegate :name, :to => :slug, :prefix => true, :allow_nil => true

  def loved_by?(member)
    love.map(&:member_id).include? member.id if member
  end

  def worn_by?(member)
    worns.map(&:member_id).include? member.id if member
  end

  def self.by_brand(brand)
    brand_id = brand.to_i
    joins(:brand).where(:brands => {:id => brand_id})
  end

  def self.by_category(category)
      category_id = category.to_i
    joins(:category).where(:categories => {:id => category_id})
  end
  
  def ensure_not_referenced_by_any_cart_item
    if cart_items.count.zero?
      return true
    else
      errors[:base] << "Cart Items present"
      return false
    end
  end

private
  def expire_cache
    Rails.cache.delete("views/product_thumbnail/#{self.id}")
  end
end
