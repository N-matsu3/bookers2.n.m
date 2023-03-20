Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: "homes#top"
get 'homes/about' => 'homes#about' , as:"about"
get '/books/:id' ,to:'books#show' ,as:"book"


resource :books, only:[:new, :index, :show]

end
