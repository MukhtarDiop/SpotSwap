Rails.application.routes.draw do
  get 'profile', to: 'profiles#show'
  get 'profile/show', to: 'profiles#show'
  get 'booking/index'
  get 'booking/show'
  get 'booking/new'
  get 'booking/create'
  get 'booking/edit'
  get 'booking/update'
  get 'booking/destroy'
  get 'bookings/:id/status', to: 'bookings#status', as: 'booking_status'
  devise_for :users
  root to: "pages#home"

  resources :spots, only: [:index, :show, :new, :create]
  resources :bookings, only: [:index, :update] do
    member do
      patch :approve
      patch :decline
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"

  # Create new booking
    get "spots", to: "spots#index" do
    get "bookings/new", to: "bookings#new"
    post "bookings", to: "bookings#create"
  end

  # Create a new Spot
  get "spots/new", to: "spots#new"
  post "spots", to: "spots#create"

  # Read One
  get "spots/:id", to: "spots#show"
end
