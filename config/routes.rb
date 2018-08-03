Rails.application.routes.draw do

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
end

root 'nurseries#index'
get '/nurseries/about' => 'nurseries#about',  as:'about'

resources :admins, only: [:index, :show, :edit, :update]
resources :users, only: [:index, :show, :edit, :update, :destroy]
resources :prices
resources :spots
resources :nurseries
resources :list_items, only: [:index, :create, :update, :destroy]
resources :list_memos, only: [:create, :update, :destroy]
resources :memos, only: [:create, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
