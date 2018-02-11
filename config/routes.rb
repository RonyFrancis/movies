Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  api_version(module: 'V1', path: { value: 'v1' }) do
    resources :movies do
      resources :rating, only: [:create]
      member do
        get 'average_rating'
      end
    end
    post 'vote', to: 'vote#voting'
    post 'create', to: 'rating#create'

    # dashboard routes
    get 'dashboard', to: 'dashboard#index'
    get 'movie/:id', to: 'dashboard#movie'
  end
end
