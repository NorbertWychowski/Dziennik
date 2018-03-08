Rails.application.routes.draw do
	root 'groups#index', as: 'home'

	get 'groups/index'

	get 'groups/show'

	resources :groups

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
