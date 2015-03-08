# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              entries#index
#                   update POST   /update(.:format)              blogs#update_all_blogs
#                   newest POST   /newest(.:format)              blogs#newest_entries
#         new_user_session GET    /users/sign_in(.:format)       sessions#new
#             user_session POST   /users/sign_in(.:format)       sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      sessions#destroy
#            user_password POST   /users/password(.:format)      devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)  devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
#                          PATCH  /users/password(.:format)      devise/passwords#update
#                          PUT    /users/password(.:format)      devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        devise/registrations#cancel
#        user_registration POST   /users(.:format)               devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          devise/registrations#edit
#                          PATCH  /users(.:format)               devise/registrations#update
#                          PUT    /users(.:format)               devise/registrations#update
#                          DELETE /users(.:format)               devise/registrations#destroy
#                  entries GET    /entries(.:format)             entries#index
#                    entry GET    /entries/:id(.:format)         entries#show
#                          PATCH  /entries/:id(.:format)         entries#update
#                          PUT    /entries/:id(.:format)         entries#update
#                          DELETE /entries/:id(.:format)         entries#destroy
#

Rails.application.routes.draw do
  
root 'entries#index'

post '/update' => 'blogs#update_all_blogs', as: :update
post '/newest' => 'blogs#newest_entries', as: :newest

namespace :api do 
  devise_for :users, controllers: {
    sessions: 'sessions'
  }
end

 # scope '/blogs' do
 #   post '/:id/download_newest_entries' => 'blogs#download_newest_entries', as: :blog_download_newest_entries
 # end

 # resources :entries, only: [:index, :show, :destroy, :update], constraints: {subdomain: 'api'}

 resources :entries, only: [:index, :show, :destroy, :update]
 # resources :blogs

  # namespace :api, path: '/', constraints: { subdomain: 'api' } do
  #   resources :entries, only: [:index, :show, :destroy, :update]
  # end

end
