
Rails.application.routes.draw do

 devise_for :users
 root to: 'homes#top'

 resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
 get "/home/about" => "homes#about", as: "about"
  # about GET    /home/about(.:format)
 resources :users, only: [:show, :edit, :update,:index]
 # patch 'lists/:id' => 'lists#update', as: 'update_list'

end