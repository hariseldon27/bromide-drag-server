Rails.application.routes.draw do
  devise_for :users,
    controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
    }
  get '/member-data', to: 'users#show'
  patch '/profile-photo/:id', to: 'users#add_profile_photo'
  

end