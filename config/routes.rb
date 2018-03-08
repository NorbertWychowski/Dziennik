Rails.application.routes.draw do
	root 'groups#index', as: 'home'

	#get 'groups/index'

	#get 'groups/show'

	get '/students/:id', to: 'students#show', as: 'student'

	resources :groups do
		resources :students
	end

	resources :students do
		resources :grades
	end

	resources :subjects

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
