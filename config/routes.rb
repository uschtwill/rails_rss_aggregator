# == Route Map
#
#                   Prefix Verb   URI Pattern                    Controller#Action
#                     root GET    /                              entries#index
#                   update POST   /update(.:format)              blogs#update_all_blogs
#                   newest POST   /newest(.:format)              blogs#newest_entries
#             user_entries GET    /users/:id/entries(.:format)   users#entries
#             api_register POST   /api/registrations(.:format)   api/registrations#create
#                api_login POST   /api/sessions(.:format)        api/sessions#create
#               api_logout DELETE /api/sessions(.:format)        api/sessions#destroy
#         new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
#             user_session POST   /users/sign_in(.:format)       devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
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

  # makes root link to an overview of all entries (the main page)
  root 'entries#index'

  # to update all blogs at once (in theory should only add such entries to the database that are not there yet) >> goes and fetches those entries from the blogs
  post '/update' => 'blogs#update_all_blogs', as: :update
  # populates the entries page by fetching x new entries
  post '/newest' => 'blogs#newest_entries', as: :newest

  # to display all posts of a specific user
  get 'users/:id/entries' => 'users#entries', :as => :user_entries

  # 
  # post 'users/:id/entries/:id' => 'users#add_entry_to_bookmarks', as => :add_to_bookmarks
  # delete 'users/:id/entries/:id' => 'entries#remove_from_bookmarks', as => :remove_from_bookmarks

  # sets up the api endpoints for user-related interactions
  namespace :api do
    devise_scope :user do
      post 'registrations' => 'registrations#create', :as => 'register'
      post 'sessions' => 'sessions#create', :as => 'login'
      delete 'sessions' => 'sessions#destroy', :as => 'logout'
    end
  end

  # sets up general user-related routes (for the web app)
  devise_for :users
  # devise_for :users, controllers: {
  #   sessions: 'sessions'
  # }


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
