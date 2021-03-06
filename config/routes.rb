ToDoList::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => :registrations }

  resources :lists
  resources :tasks
  resources :projects do
    resources :collaborations
  end
  get 'my/tasks' => "tasks#assigned", :as => :assigned_tasks

  root :to => "application#welcome"
end

