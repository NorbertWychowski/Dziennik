Rails.application.routes.draw do
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
  post 'add_grade', to: 'grade#add_grade'
  resources :grades



  resources :groups do
    resources :students
  end

  resources :users do
    resources :grades
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
