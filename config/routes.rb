Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'articles/label', to: 'articles#label'
  resources :clothes do
    resources :comments, only: [ :new, :create ]
  end
  resources :comments, only: [ :show, :edit, :update, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Prefix Verb   URI Pattern                          Controller#Action
# new_user_session GET    /users/sign_in(.:format)                devise/sessions#new
#     user_session POST   /users/sign_in(.:format)            devise/sessions#create
# destroy_user_session DELETE /users/sign_out(.:format)            devise/sessions#destroy
# new_user_password GET    /users/password/new(.:format)          devise/passwords#new
# edit_user_password GET    /users/password/edit(.:format)            devise/passwords#edit
#    user_password PATCH  /users/password(.:format)             devise/passwords#update
#                  PUT    /users/password(.:format)       devise/passwords#update
#                  POST   /users/password(.:format)           devise/passwords#create
# cancel_user_registration GET    /users/cancel(.:format)           devise/registrations#cancel
# new_user_registration GET    /users/sign_up(.:format)         devise/registrations#new
# edit_user_registration GET    /users/edit(.:format)       devise/registrations#edit
# user_registration PATCH  /users(.:format)              devise/registrations#update
#                  PUT    /users(.:format)                devise/registrations#update
#                  DELETE /users(.:format)            devise/registrations#destroy
#                  POST   /users(.:format)            devise/registrations#create
#             root GET    /                       pages#home
#   articles_label GET    /articles/label(.:format)      articles#label
#  clothe_comments GET    /clothes/:clothe_id/comments(.:format)      comments#index
#                  POST   /clothes/:clothe_id/comments(.:format)     comments#create
# new_clothe_comment GET    /clothes/:clothe_id/comments/new(.:format)                                               comments#new
# edit_clothe_comment GET    /clothes/:clothe_id/comments/:id/edit(.:format)     comments#edit
#   clothe_comment GET    /clothes/:clothe_id/comments/:id(.:format)    comments#show
#                  PATCH  /clothes/:clothe_id/comments/:id(.:format)      comments#update
#                  PUT    /clothes/:clothe_id/comments/:id(.:format)     comments#update
#                  DELETE /clothes/:clothe_id/comments/:id(.:format)      comments#destroy
#          clothes GET    /clothes(.:format)               clothes#index
#                  POST   /clothes(.:format)             clothes#create
#       new_clothe GET    /clothes/new(.:format)           clothes#new
#      edit_clothe GET    /clothes/:id/edit(.:format)         clothes#edit
#           clothe GET    /clothes/:id(.:format)          clothes#show
#                  PATCH  /clothes/:id(.:format)           clothes#update
#                  PUT    /clothes/:id(.:format)          clothes#update
#                  DELETE /clothes/:id(.:format)        clothes#destroy
