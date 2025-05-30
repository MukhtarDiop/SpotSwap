Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root to: "pages#home"
  # Approve and decline new bookings
  resources :bookings, only: [:index, :update] do
    member do
      patch :approve
      patch :decline
    end
  end

  # Show all spots
  resources :spots, only: [:index, :show, :new, :create, :destroy, :edit, :update] do
    # Create new booking
    resources :bookings, only: [:new, :create]
  end

  # Read One Profile
  resource :profile, only: [:show, :update]

  # See booking status as user
  get 'bookings/:id/status', to: 'bookings#status', as: 'booking_status'

  # See booking status as renter
  get "myspotbookings", to: "bookings#myspotbookings", as: :my_spot_bookings
end
