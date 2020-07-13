Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'articles/label', to: 'articles#label'
  resources :clothes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
