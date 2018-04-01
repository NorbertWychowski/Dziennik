Rails.application.routes.draw do
  root 'static_pages#home'

  get 'errors/forbidden'
  get 'error/forbidden'
  get 'static_pages/home'

  #logowanie
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  #nauczyciele
  resources :users
  get 'user/:id/group/:teacher_group_subject', to: 'users#user_groups', as: 'users_groups'
  get 'profile/:id', to: 'users#profile', as: 'user_profile'

  #uczniowe
  get 'student/:id/notes', to: 'students#show_notes', as: 'student_notes'
  get 'student/:id/grades', to: 'students#show_grades', as: 'student_grades'
  get 'student/change_group', to: 'students#change_group'
  resources :students

  #sesja
  resource :sessions

  #oceny
  resources :grades
  get 'grade/add_grade', to: 'grades#add_grade'
  get 'grade/edit_grade', to: 'grades#edit_grade'
  get 'grade/delete_grade', to: 'grades#delete_grade'
  get 'grade/edit_grades', to: 'grades#edit_grades'

  #uwagi
  resource :notes
  get 'note/add_note', to: 'notes#add_note'
  get 'note/delete_note', to: 'notes#delete_note'

  #kody bledu
  match '/err/403', to: 'errors#forbidden', via: :all
  match '/err/404', to: 'errors#not_found', via: :all
  match '/err/500', to: 'errors#internal_server_error', via: :all

  #klasy
  get 'group/add_group', to: 'groups#add_group'
  resources :groups

  #przedmioty
  get 'subject/add_subject', to: 'subjects#add_subject'
  get 'subject/delete_subject', to: 'subjects#delete_subject'
  resources :subjects

  #lekcje
  get 'lesson/add_lesson', to: 'teacher_group_subjects#add_lesson'
  get 'lesson/delete_lesson', to: 'teacher_group_subjects#delete_lesson'
  resources :teacher_group_subjects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
