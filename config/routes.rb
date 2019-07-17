Rails.application.routes.draw do
  use_doorkeeper
  resources :workers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #root "main#index"
  root :to => "main#index"
  resources :room, :student, :advisor
  get "student/index"
  get "advisor/index"
  get "room/index"
  post 'student/create' => "student#create"

  namespace 'api' do
    get 'student', to: 'student#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
