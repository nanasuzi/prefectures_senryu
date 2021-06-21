Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    :sessions => 'admin/sessions'
  }

  namespace :admin do
    root to: 'homes#top'
      resources :themes, except:[:new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
