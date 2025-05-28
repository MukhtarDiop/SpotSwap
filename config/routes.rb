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
  get "myspotbookings", to: "bookings#myspotbookings", as: :my_spot_bookings
  devise_for :users
  root to: "pages#home"

  resources :bookings, only: [:index, :update] do
    member do
      patch :approve
      patch :decline
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "spots", to: "spots#index" do
    # create new booking
    get "bookings/new", to: "bookings#new"
    post "bookings", to: "bookings#create"
  end

  # Create a new Spot
  get "spots/new", to: "spots#new", as: :new_spot
  post "spots", to: "spots#create"

  # Read One
  get "spots/:id", to: "spots#show", as: :spot

  resources :spots do
    resources :bookings, only: [:new, :create]
  end
end
