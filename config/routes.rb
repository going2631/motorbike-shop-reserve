Rails.application.routes.draw do
  namespace :admin do
    
  end
  devise_for :admins
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "homes#top"
    resources :customers, only: [:index, :edit, :update, :show]
    resources :services
    resources :columns
    resources :reservations, only: [:show, :edit, :update, :destroy]
  end
  
  
     devise_scope :customers do
       get "/customers/sign_up", to: "public/customers/registrations#new",
       get "/customers/sign_in", to: "public/customers/sessions#new"
     end
 
  
  scope module: :public do
    root to: "homes#top"
    
    resources :customers, only: [:show, :edit, :update]
    resources :columns, onky: [:index, :show] do
      resource :favorite, only: [:create, :destroy]
    end
    resources :reservations, only: [:new, :create, :index, :show]
    
    
  end

end
