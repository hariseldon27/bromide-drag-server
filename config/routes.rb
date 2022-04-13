Rails.application.routes.draw do

  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
    # get basic user details
  get '/member-data', to: 'users#show'
    # add (update) a profile photo to a user
  patch '/profile-photo/:id', to: 'users#add_profile_photo'
    # start new gallery
  post '/new-gallery', to: 'galleries#new_gallery'
    # publish gallery
  patch '/gallery/:id', to: 'galleries#publish'
    # get galleries with featured image url
  get '/user-galleries', to: 'galleries#user_galleries'
    # get the main gallery item to retreive blocks
  get '/gallery/:id', to: 'galleries#show'
  
  # create new block from gallery builder
  post '/new-block/', to: 'blocks#new_block'  
  # get gallery blocks for show
  get '/gallery/:id/blocks', to: 'blocks#gallery_blocks'

 

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end