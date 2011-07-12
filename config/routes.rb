::Refinery::Application.routes.draw do
  resources :products, :only => [:index, :show]
  resource :love, :only => [:create, :destroy]
  resource :worn, :only => [:create, :destroy]
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end
    resources :brands, :only => [:new, :create ]
    resources :categories, :only => [:new, :create ]
  end
  
  resources :carts, :only => [:index, :create, :update]
  
  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :carts, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
  resources :cart_items, :only => [:destroy]
end
