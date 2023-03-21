Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get '/books' => 'books#books'
get 'homes/about' => 'homes#about' , as:"about"

get 'users/show'
get 'users/edit'
get '/users' => 'users#users' , as:"users"


resources :books, only:[:new, :index, :show, :create, :destroy, :edit]
resources :users, only: [:show, :edit]

end
