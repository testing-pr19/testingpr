Rails.application.routes.draw do
  resources :file_records
  resources :file_data
  resources :uploaded_files do
    member do
      get :schedule_slots
      get :export_schedule
    end
  end
  resources :invigilators
  resources :slots
  resources :class_names 
  root 'main#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
