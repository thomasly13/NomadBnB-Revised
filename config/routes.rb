Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html




  namespace :api, defaults: {format: :json} do

    resources :users, only: [:create, :show]
    
    resource :session, only: [:create, :show, :destroy]

    resources :listings, only: [:show, :index]

    resources :reservations, only: [:index, :show, :create, :destroy, :update]

    resources :reviews, only: [:create, :destroy, :update]
    post 'users/check', to: 'users#check'
    
  end

  
  get '*path', to: "static_pages#frontend_index"
end
