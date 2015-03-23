Citydogshare::Application.routes.draw do
  ## Route Route ##
  root :to => 'welcome#index'

  ## Session Routes ##
  get 'auth/:provider/callback', to: 'sessions#handle_auth', as: 'auth_success'
  get 'auth/failure', to: 'sessions#handle_failure', as: 'auth_failure'
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  get 'create', to: 'sessions#create', as: 'create_session'
  get 'login', to: 'sessions#login', as: 'login'
  get 'signup', to: 'sessions#signup', as: 'signup'
  
  ## User Routes ##
  resources :users, only: [:show, :edit, :update, :destroy, :index]
  post 'users/:id/edit', to: 'users#edit'


  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  match 'dashboard' => 'welcome#dashboard'
end
