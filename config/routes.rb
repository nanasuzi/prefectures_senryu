Rails.application.routes.draw do


  devise_for :users, path: 'user', controllers: {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }



 root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
    scope module: :public do
      resources :posts, except:[:new, :index] do
        resource :favorites, only:[:create, :destroy]
          resources :comments, only:[:create, :destroy]
      end
    end






  devise_for :admins, path: 'admin', controllers: {
    :sessions => 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
      resources :themes, except:[:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
