Rails.application.routes.draw do
  namespace :api do
    resources :uploads, only: :create
  end
end
