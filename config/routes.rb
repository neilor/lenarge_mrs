LenargeMrs::Application.routes.draw do
  resources :ferro_ctes do
    collection {post :import}
  end

  resources :rodo_ctes do
    collection {post :import}
  end

  devise_for :users

  root 'home#index'
end
