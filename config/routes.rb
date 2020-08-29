Rails.application.routes.draw do
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
 resources :authors 
 
get '/authors/:author_id/quotes' =>'quotes#index', as: 'author_quotes'
post '/authors/:author_id/quotes' =>'quotes#create', as: 'create_author_quotes'
get '/authors/:author_id/quotes/new' =>'quotes#new', as: 'new_author_quotes'
get '/authors/:author_id/quotes/:id/edit' =>'quotes#show', as: 'edit_author_quotes'
get '/authors/:author_id/quotes/:id' =>'quotes#edit', as: 'show_author_quotes'
patch '/authors/:author_id/quotes/:id' =>'quotes#update', as: 'update_author_quotes'
delete '/authors/:author_id/quotes/:id' =>'quotes#delete', as: 'delete_author_quotes'

get '/users' =>'users#index', as: 'users'
post '/users' =>'users#create', as: 'create_users'
get '/users/signup' =>'users#new', as: 'new_users'
get '/users/:id' =>'users#show', as: 'show_users'
get '/users/:id/edit' =>'users#edit', as: 'edit_users'
patch '/users/:id' =>'users#update', as: 'update_users'
delete '/users/:id' =>'users#delete', as: 'delete_users'
get '/login' => 'users#login', as: 'login_users'
post '/users/authenticate' => 'users#auth', as:'auth_users'



root 'quotes#randomizer' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
