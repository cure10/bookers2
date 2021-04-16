Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :homes, only: [:new, :create, :index]
  get 'homes/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:new, :create, :index, :show, :edit, :update]
end
