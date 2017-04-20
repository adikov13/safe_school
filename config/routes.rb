Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "user/registrations"}
  namespace :admin do 
  	resources :students, :teachers, :groups, :parents
  end
 	resources :messages, controller: "conversations", as: "messages"
 	post "messages/create", to: "messages#create", as: "create_message"
  root 'welcome#index'
  resources :marks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
