# == Route Map
#
#                       Prefix Verb   URI Pattern                                  Controller#Action
#                         root GET    /                                            entries#index
#       blogs_update_all_blogs POST   /blogs/update_all_blogs(.:format)            blogs#update_all_blogs
# blog_download_newest_entries POST   /blogs/:id/download_newest_entries(.:format) blogs#download_newest_entries
#                        blogs GET    /blogs(.:format)                             blogs#index
#                              POST   /blogs(.:format)                             blogs#create
#                     new_blog GET    /blogs/new(.:format)                         blogs#new
#                    edit_blog GET    /blogs/:id/edit(.:format)                    blogs#edit
#                         blog GET    /blogs/:id(.:format)                         blogs#show
#                              PATCH  /blogs/:id(.:format)                         blogs#update
#                              PUT    /blogs/:id(.:format)                         blogs#update
#                              DELETE /blogs/:id(.:format)                         blogs#destroy
#                      entries GET    /entries(.:format)                           entries#index
#                        entry GET    /entries/:id(.:format)                       entries#show
#                              DELETE /entries/:id(.:format)                       entries#destroy
#

Rails.application.routes.draw do
 root 'entries#index'

post '/update' => 'blogs#update_all_blogs', as: :update
post '/newest' => 'blogs#newest_entries', as: :newest

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
