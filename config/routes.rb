Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'

  resources :boards do
    resources :posts, except: [:index], shallow: true do
      resources :comments, shallow: true do
        post :vote
      end
    end
  end

  resources :moderators, except: [:show, :edit, :update]
  get "/sandbox/counter" => "sandbox#counter"
end
