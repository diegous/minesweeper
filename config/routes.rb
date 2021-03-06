Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'api/registrations',
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    resources :games, only: [:index, :show, :create] do
      member do
        post :play
        post :flag
        post :reveal
      end
    end

    resource :users, only: [:create]
  end

  get '*path', to: 'spa#index'
end
