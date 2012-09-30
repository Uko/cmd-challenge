CmdChalange::Application.routes.draw do
  devise_for :users

  resources :tasks, :except => :show do
    member do
         post 'share'
    end
  end

  root :to => 'tasks#index'

end
