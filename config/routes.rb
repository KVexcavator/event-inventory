Rails.application.routes.draw do
  root to: "events#index"
  get "/users/sign_out", to: "events#index"
  get 'tags/:tag', to: 'events#index', as: :tag
  devise_for :users
  resources :events do
    get :join, to: 'events#join', as: 'join'
    get :accept_request, to: 'events#accept_request', as:'accept_request'
    get :reject_request, to: 'events#reject_request', as:'reject_request'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
