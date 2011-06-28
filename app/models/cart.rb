class Cart < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  
end
