Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get '/books' => 'books#books' , as:"books"
get 'homes/about' => 'users#show', as:"show"

get  'users/:id' => 'users#show'
get 'users/edit'

patch 'users/:id' => 'users#update' , as: 'update_user'
delete 'users/:id' => 'users#destroy', as: 'destroy_user'


patch 'books/:id' => 'books#update' , as: 'update_book'
delete 'books/:id' => 'books#destroy', as: 'destroy_book'

resources :books, only:[:new, :index, :show, :create, :destroy, :edit]
resources :users, only: [:show, :edit]

end
