Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'

  resources :boards do
    resources :posts do
      resources :comments, shallow: true do
        resources :votes, shallow: true

      end
    end
  end
end
