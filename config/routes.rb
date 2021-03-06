Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :hangouts
  #resources :invitations, only: [:create, :destroy] - not needed because invitations will only be generated by adding guests to hangouts
  #do
    # resources :invitations -- not needed yet -- would be good if creating hangouts you invite guests at the same time
    # resources :users - not needed yet
  #end

  post "friendships", to: "friendships#create"
  delete "friendships", to: "friendships#destroy" #pulling this out manually because convention is to go to specific id to delete; i just want to post to sans-view URL of friendships

  patch "invitation/:id", to: "invitations#update", as: "rsvp"

  post "hangouts/:id/guests", to: "hangouts#add_guests"
  root "sessions#new", as: "signin"
  post "/sessions", to: "sessions#create"
  delete "/sessions", to: "sessions#destroy"


end
