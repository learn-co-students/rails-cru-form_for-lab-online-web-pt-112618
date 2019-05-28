Rails.application.routes.draw do
  resources :artists, only: [:create, :new, :show, :edit, :update]
  resources :songs, only: [:index, :create, :new, :show, :edit, :update]
  resources :genres, only: [:create, :new, :show, :edit, :update]
end
