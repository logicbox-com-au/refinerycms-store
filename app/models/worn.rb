class Worn < ActiveRecord::Base
  belongs_to :member
  belongs_to :wornable, :polymorphic => true, :counter_cache => true
end
