Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :cards, except: %i[edit update] do
    member do
      post :toggle_favourites
    end
  end

  resources :summaries do
    post 'generate_summary', on: :collection
  end

  resources :favourites, only: :index

  # Defines the root path route ("/")
  # root "articles#index"
end
