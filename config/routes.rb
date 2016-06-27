Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'boards#index'

  resources :boards do
    resources :posts, except: [:index], shallow: true do
      resources :comments, shallow: true
    end
  end

  resources :moderators, except: [:show, :edit, :update]

  resources :posts do
    member do
      put "vote", to: "post#upvote"
      put "downvote", to: "post#downvote"
    end
  end

  get "/sandbox/counter" => "sandbox#counter"
end
