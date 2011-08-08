class Category < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  belongs_to :parent, :class_name => 'Category'
  has_many :children, :class_name => 'Category', :foreign_key => 'parent_id', :dependent => :destroy

  def self.destroy_category_or_subcategory(params)
    unless params[:sub_category].blank?
      subcategory = self.destroy_subcategory params[:sub_category]
    else
      category = self.destroy_category params[:category]
    end
    return category, subcategory
  end

  def self.destroy_category(category_id)
    category = Category.find category_id
    category.destroy if category
    category
  end

  def self.destroy_subcategory(subcategory_id)
    subcategory = Category.find subcategory_id
    subcategory.destroy if subcategory
    subcategory
  end
end
