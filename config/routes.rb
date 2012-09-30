CmdChalange::Application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    get 'get-users' => 'users#get_users', :as => :get_users
  end

  resources :tasks, :except => :show do
    member do
         post 'share'
    end
  end

  root :to => 'tasks#index'

end
