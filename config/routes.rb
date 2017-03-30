Rails.application.routes.draw do
  resources :joke_requests, only: :create
end
