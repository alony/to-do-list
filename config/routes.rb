ToDoList::Application.routes.draw do
  devise_for :users

  resources :projects
  resources :lists
  resources :tasks

  get 'my/tasks' => "tasks#assigned", :as => :assigned_tasks

  root :to => "application#welcome"
end

