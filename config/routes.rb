Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get '/books' => 'books#index' , as:"books"


get  'users/:id' => 'users#show'
get 'users/edit'

patch 'users/:id' => 'users#update' , as: 'update_user'
delete 'users/:id' => 'users#destroy', as: 'destroy_user'


delete 'books/:id' => 'books#destroy', as: 'destroy_book'

resources :books, only:[:new, :index, :show, :create, :edit]
resources :users, only: [:show, :edit]

end
