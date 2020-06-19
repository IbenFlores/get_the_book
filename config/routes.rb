Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'about', to: 'pages#about', as: :about
  resources :users, except: [:index, :show]
  resources :books do
    collection do
      get "my_books"
    end
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:destroy, :index]
end
