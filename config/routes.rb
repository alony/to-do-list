ToDoList::Application.routes.draw do
  devise_for :users

  resources :projects
  resources :lists
  resources :tasks

  root :to => "application#welcome"
end
