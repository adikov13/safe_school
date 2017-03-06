Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "user/registrations"}
  namespace :admin do 
  	resources :students
  	resources :parents
  end
  root 'welcome#index'
  resources :teacher, :parent, :student
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
