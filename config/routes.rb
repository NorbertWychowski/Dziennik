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
  get ':id/profile', to: 'users#profile', as: 'users_profile'
  get ':id', to: 'users#profile'

  #uczniowe
  get 'student/:id/notes', to: 'students#show_notes', as: 'student_notes'
  get 'student/:id/grades', to: 'students#show_grades', as: 'student_grades'
  resources :students do
    resources :grades
  end

  #sesja
  resource :sessions

  #oceny
  resources :grades
  get 'grade/add_grade', to: 'grades#add_grade'
  get 'grade/edit_grade', to: 'grades#edit_grade'
  get 'grade/delete_grade', to: 'grades#delete_grade'
  get 'grade/edit_grades', to: 'grades#edit_grades'

  #uwagi
  resources :notes
  get 'note/add_note', to: 'notes#add_note'
  get 'note/delete_note', to: 'notes#delete_note'

  #kody bledu
  match '/err/403', to: 'errors#forbidden', via: :all
  match '/err/404', to: 'errors#not_found', via: :all
  match '/err/500', to: 'errors#internal_server_error', via: :all

  resources :groups do
    resources :students
  end

  resources :users do
    resources :grades
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
