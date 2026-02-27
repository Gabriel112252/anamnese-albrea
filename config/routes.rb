Rails.application.routes.draw do
  root "patients#index"

  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :patients
  resources :users
  resources :intake_links, only: [:index, :create]

  get  "/f/:token", to: "public_forms#show",   as: :public_form
  post "/f/:token", to: "public_forms#submit"
end