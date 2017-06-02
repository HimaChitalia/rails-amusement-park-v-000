Rails.application.routes.draw do

 resources :users, :attractions, :rides

 get '/signin' => "sessions#new"
 post "/sessions/create", to: "sessions#create"
 delete '/signout' => "sessions#destroy"

 root 'attractions#greeting'


end
