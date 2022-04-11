Rails.application.routes.draw do
  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  get '/member-data', to: 'users#show'
  patch '/profile-photo/:id', to: 'users#add_profile_photo'
  
    # POST => gallery#create /new-gallery create new gallery
    # POST => gallery#block-builder /new-gallery/id/block-builder/
end