Rails.application.routes.draw do
  get 'welcome/index'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  resources :articles do
    resources :comments
  end
  root 'welcome#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
