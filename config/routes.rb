Rails.application.routes.draw do
  get 'errors/forbidden'

  get 'error/forbidden'

  get 'static_pages/home'

  root 'static_pages#home'

  #logowanie
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #nauczyciele
  resources :users
  get 'users/:id/:teacher_group_subject', to: 'users#user_groups', as: 'users_groups'

  #uczniowe
  resources :students do
    resources :grades
  end

  #sesja
  resource :sessions

  #oceny
  resources :grades
  get 'add_grade', to: 'grades#add_grade'

  #kody bledu
  match '/403', to: 'errors#forbidden', via: :all
  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  resources :groups do
    resources :students
  end

  resources :users do
    resources :grades
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
