Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "fans#index"
  get "fans" => "fans#index"
  resources :fans
end
