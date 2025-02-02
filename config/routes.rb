Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  get 'home/about', to: 'home#about', as: 'about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :books, only: [:index, :show, :edit, :update, :create, :new, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
