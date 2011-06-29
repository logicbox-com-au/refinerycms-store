::Refinery::Application.routes.draw do
  resources :products, :only => [:index, :show]
  resource :love, :only => [:create, :destroy]
  resource :worn, :only => [:create, :destroy]
  
  match 'products/brand/:brand_name' => 'products#index'
  match 'products/category/:category_name' => 'products#index'
  match "products/filter/:filter" => "products#index"

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :products, :except => :show do
      collection do
        post :update_positions
      end
    end
    resources :brands, :only => [:new, :create ]
    resources :categories, :only => [:new, :create ]
  end
end
