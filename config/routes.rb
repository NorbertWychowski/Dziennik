Rails.application.routes.draw do
  root 'static_pages#home'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'students/new', to: 'students#new'
  get 'students/:id', to: 'students#show'

  resource :sessions

  resources :groups do
    resources :students
  end

  resources :students do
    resources :grades
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
