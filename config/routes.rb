Rails.application.routes.draw do
  get :download_file, to: 'documents#download_file'
  resources :documents

  devise_for :users
  root to: 'documents#index'
end
