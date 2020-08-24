Rails.application.routes.draw do
  get '/quotes' => 'quotes#index', as:'quotes'
  # get '/home' => 'quotes#randomizer', as:'home_quotes'
  get '/quotes/new' => 'quotes#new' , as:'new_quotes'
  post '/quotes' => 'quotes#create' , as:'create_quotes'
  get '/quotes/:id' => 'quotes#show', as:'show_quotes'
  get '/quotes/:id/edit' => 'quotes#edit' , as:'edit_quotes'
  patch '/quotes/:id' => 'quotes#update' , as:'update_quotes'
  delete '/quotes.:id' => 'quotes#destroy' , as:'delete_quotes'
  root 'quotes#randomizer' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
