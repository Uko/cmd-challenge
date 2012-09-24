CmdChalange::Application.routes.draw do
  resources :tasks, :except => :show

  root :to => 'tasks#index'

end
