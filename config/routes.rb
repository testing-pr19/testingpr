Rails.application.routes.draw do
  resources :invigilators
  resources :slots
  resources :class_names
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
