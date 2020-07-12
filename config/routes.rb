Rails.application.routes.draw do
  root to: 'pages#home'
  get 'articles/label', to: 'articles#label'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
