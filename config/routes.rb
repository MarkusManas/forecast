Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :locations, only: [:show] do
    resources :weather_forecasts, only: [:index]
  end
end
