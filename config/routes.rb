Rails.application.routes.draw do
  namespace :admin do
    
  end
  devise_for :admins, controllers: {
    sessions: 'admin/admins/sessions',
    passwords: 'admin/admins/passwords',
    registrations: 'admin/admins/registrations'  
  }
  devise_for :customers, controllers: {
    sessions: 'public/customer/sessions',
    passwords: 'public/customer/passwords',
    registrations: 'public/customer/registrations'  
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "homes#top"
    get "/columns/search" => 'columns#search'
    resources :customers, only: [:index, :edit, :update, :show]
    resources :services
    resources :columns
    resources :reservations, only: [:show, :edit, :update, :destroy]
  end
  
 
  
  scope module: :public do
    root to: "homes#top"
    
    resources :customers, only: [:show, :edit, :update] do
      resources :reservations, only: [:index]
    end
    
    resources :columns, only: [:index, :show] do
      resource :favorite, only: [:create, :destroy]
    end
    
    get "/columns/search" => 'columns#search'
    
    resources :services ,only:[:index, :show]do
       resources :reservations, only: [:new, :create, :show]
    end
    
    
    get '/reservations/confirm', 'reservations#confirm'
   
    
    
  end

end
