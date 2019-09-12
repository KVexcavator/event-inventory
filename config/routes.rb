Rails.application.routes.draw do
  root to: "events#index"
  get "/users/sign_out", to: "events#index"
  get 'tags/:tag', to: 'events#index', as: :tag
  devise_for :users
  resources :events do
    get :join, to: 'events#join', as: 'join'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
