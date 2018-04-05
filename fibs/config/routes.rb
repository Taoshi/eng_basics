Rails.application.routes.draw do
  root 'fibs#index'
  resources :fibs
end
