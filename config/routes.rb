Rails.application.routes.draw do
  get 'gists/index'
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root to: 'tests#index'
  resources :tests, only: :index do
    member do
      post :start
    end
  end
  resources :test_passages, only: [:show, :update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: :index
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: [:index, :show]
      end
    end
  end
end
