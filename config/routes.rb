Rails.application.routes.draw do
	root 'main_page#home'
	get 		'top_list' 	=> 'main_page#top_list'
	get 		'sign_up' 	=> 'users#new'
	get 		'login'			=> 'sessions#new'
	post 		'login'			=> 'sessions#create'
	delete 	'logout'		=> 'sessions#destroy'
	resources :users
end
