Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :homes, only: [:new, :create, :index]
  get 'home/about' => 'homes#about'
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :create, :index, :show, :edit, :update, :followindex, :followerindex] do
    resource :relationships, only: [:follow, :unfollow]
  end
end
