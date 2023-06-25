
Rails.application.routes.draw do

 devise_for :users
 root to: 'homes#top'

 resources :books, only: [:new, :create, :index, :show, :destroy,:edit,:update]
 get "/home/about" => "homes#about", as: "about"
  # about GET    /home/about(.:format)
 resources :users, only: [:show, :edit, :update,:index]
 # patch 'lists/:id' => 'lists#update', as: 'update_list'

end