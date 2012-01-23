ToDoList::Application.routes.draw do
  devise_for :users

  resources :projects
  resources :lists
  resources :tasks

  root :to => "projects#index"
end
