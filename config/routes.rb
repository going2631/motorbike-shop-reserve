Rails.application.routes.draw do
  namespace :admin do
    
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "homes#top"
    resources :customers , only: [:index, :edit, :update, :show]
    resources :services
    resources :columns
    resources :reservations, only: [:show, :edit, :update, :destroy]
  end
  
  scope module: :public do
    root to: "homes#top"
    resources :customers, only: [:show, :edit, :update]
    resources :columns, onky: [:index, :show]
    resources :reservations, only: [:new, :create, :index, :show]
    resources :favorites, only: [:create, :destroy]
    
  end
end
