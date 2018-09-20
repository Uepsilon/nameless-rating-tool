Rails.application.routes.draw do
  resources :locations do
    resources :visits
  end
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
