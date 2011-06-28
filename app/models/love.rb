class Love < ActiveRecord::Base
  belongs_to :member
  belongs_to :loveable, :polymorphic => true, :counter_cache => true
end
