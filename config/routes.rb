Rails.application.routes.draw do
  devise_for :users, path: 'user', controllers: {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }

  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  scope module: :public do
    get 'search' => 'posts#search'
    resources :posts, except: [:new, :index] do
      resource :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update]
    get "/users/:id/unsubscribe", to: "users#unsubscribe", as: 'users/unsubscribe'
    patch "/users/:id/withdrawl", to: "users#withdrawl", as: 'users/withdrawl'
    resources :themes, only: [:index, :show]
    resources :relationships, only: [:create, :destroy]
    resources :notifications, only: [:index]
    resources :users do
      get :followings, on: :member
      get :followers, on: :member
    end
  end

  devise_for :admins, path: 'admin', controllers: {
    :sessions => 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
    resources :themes, except: [:new]
    resources :users, only: [:show, :edit, :update]
    get 'search' => 'posts#search'
    resources :posts, only: [:index, :show, :destroy] do
      resources :comments, only: [:destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
