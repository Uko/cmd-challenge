CmdChalange::Application.routes.draw do
  devise_for :users

  resources :tasks, :except => :show

  root :to => 'tasks#index'

end
