Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  
  get 'articles/label', to: 'articles#label'
  get 'articles/lin', to: 'articles#lin'
  get 'clothes/:id/add', to: 'clothes#add', as: 'add_to_cart'
  get 'clothes/:id/remove', to: 'clothes#remove', as: 'remove_from_cart'
  get 'homes/who', to: 'homes#who'
  get 'homes/contact', to: 'homes#contact'
  get 'homes/condition', to: 'homes#condition'
  get '/partners/spitzberg', to: 'partners#spitzberg'
  get 'clothes/:function/index', to: 'clothes#index', as: "clothes_by_type"
  get 'line_items/:line_id/prev', to: 'line_items#prev', as: "prev_line"
  get 'line_items/:line_id/next', to: 'line_items#next', as: "next_line"
  get 'line_items/:line_id/up', to: 'line_items#up', as: "up_line"
  get 'line_items/:line_id/down', to: 'line_items#down', as: "down_line"


  # tuto amazon mailer
  post '/send_email', to: 'pages#send_email', as: 'send_email'


  resources :clothes do
    resources :comments, only: [ :new, :create, :edit, :update ]
    resources :line_items, only: [ :new, :create ]
    resources :scalings
    resources :dyeings
  end
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end

  resources :comments, only: [ :show, :destroy ]
  resources :carts, only: [ :show, :index ]
  resources :line_items, only: [ :destroy ]
  resources :delivery_adresses
  resources :dyeings
  
  resources :colors
  resources :sizes

  
  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
